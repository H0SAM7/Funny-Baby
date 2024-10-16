import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funny_baby/core/errors/failure.dart';
import 'package:funny_baby/core/helper/auth_helper.dart';
import 'package:funny_baby/core/helper/shared_pref.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

  Future<void> registerUser(
      String email, String password, String username) async {
    emit(AuthLoading());
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        if (!user.emailVerified) {
          await user.sendEmailVerification();
          log('Verification email sent. Please check your inbox.');
        }
        bool eVerified = await waitForEmailVerification(user);
        await checkEmailVerification(user);

        if (eVerified) {
          await firestore.collection('users').doc(user.uid).set({
            'uid': user.uid,
            'email': email,
            'username': username,
            // Add other fields as needed
          });
          emit(AuthSuccess());
          // await SharedPreference().setString('email', email);
          // await SharedPreference().setString('userName', username);
          log('User account created successfully.');
        } else {
          // If email verification fails, delete the user and throw an exception
          await user.delete();
          emit(AuthFailure(errMessage: 'Email verification failed.'));
        }
      }
    } catch (e) {
      emit(AuthFailure(
          errMessage: FirebaseFailure.fromFirebaseException(e as Exception)
              .errMessage
              .toString()));
    }
  }

  Future<void> loginUser(String email, String password) async {
    emit(AuthLoading());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(AuthSuccess());
      log('The Login Successful');
    } catch (e) {
      emit(AuthFailure(
          errMessage: FirebaseFailure.fromFirebaseException(e as Exception)
              .errMessage
              .toString()));
    }
  }

  Future<void> deleteUser() async {
    emit(AuthLoading());
    try {
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .delete();
        log("Document with UID ${user!.uid} deleted successfully");
        await user!.delete();
        emit(AuthSuccess());
        // Account deletion successful
        log("Account deleted successfully.");
      } else {
        emit(AuthFailure(errMessage: 'No user is currently signed in.'));
      }
  
    } catch (e) {
      emit(AuthFailure(
          errMessage: FirebaseFailure.fromFirebaseException(e as Exception)
              .errMessage
              .toString()));
    }
  }

  Future<void> logout() async {
     emit(AuthLoading());
    try {
      await auth.signOut();
     // await SharedPreference().setBool("isLoggedIn", false);
         emit(AuthSuccess());
      log("User logged out successfully.");
    } catch (e) {
        emit(AuthFailure(
          errMessage: FirebaseFailure.fromFirebaseException(e as Exception)
              .errMessage
              .toString()));
      log("Error logging out: $e");
    }
  }

  Future<void> updatePasswordAndName(
      String oldPassword, String newPassword, String username) async {
    try {
      User? user = auth.currentUser;

      if (user != null) {
        String email = user.email!;

        // Re-authenticate the user
        AuthCredential credential = EmailAuthProvider.credential(
          email: email,
          password: oldPassword,
        );
        await user.reauthenticateWithCredential(credential);
        log('Re-authentication successful.');
        await user.updatePassword(newPassword);

        // Update user account in Firestore or other actions
        await firestore.collection('users').doc(user.uid).update({
          'uid': user.uid,
          'username': username,
          // Add other fields as needed
        });
        log('User account updated successfully.');
      }
    } catch (e) {
      log('Error updating user: $e');
      // Handle errors, e.g., show a message to the user
    }
  }

  Future<void> forgotPassword({required String email}) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      // Check if the user with the given email exists
      if (querySnapshot.docs.isNotEmpty) {
        // If email is found, send the password reset email
        await auth.sendPasswordResetEmail(email: email);
      } else {
        // If email is not found, throw an exception or handle it accordingly
        throw Exception('No user found with this email');
      }
    } on FirebaseAuthException catch (err) {
      // Handle FirebaseAuth specific errors
      throw Exception(err.message.toString());
    } catch (err) {
      // Handle any other errors
      throw Exception(err.toString());
    }
  }

// Future<ProductModel?> searchProductByName(String productName) async {
//   try {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//         .collection('products')
//         .where('name', isEqualTo: productName)
//         .get();

//     if (querySnapshot.docs.isNotEmpty) {
//       // Assuming you want the first match
//       DocumentSnapshot doc = querySnapshot.docs.first;
//       return ProductModel.fromDocument(doc);
//     } else {
//       log('No products found with the name $productName');
//       return null;
//     }
//   } catch (e) {
//     log('Error searching for product: $e');
//     return null;
//   }
// }

  Future<UserCredential> signInWithGoogle() async {
    emit(AuthLoading());
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      // Force sign out from any previous Google account
      await googleSignIn.signOut();

      // Trigger the authentication flow and prompt for account selection
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        // Handle the case where the user cancels the sign-in
        throw FirebaseAuthException(
          code: 'sign_in_canceled',
          message: 'Sign-in was canceled by the user.',
        );
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final String? email = userCredential.user?.email;
      final String? uid = userCredential.user?.uid;
   //   await SharedPreference().setString('email', email!);

      await firestore.collection('users').doc(uid).set({
        'uid': uid,
        'email': email,

        // Add other fields as needed
      });
      emit(AuthSuccess());
      // Once signed in, return the UserCredential
      return userCredential;
    } catch (e) {
      // Log and rethrow any other exceptions
      log('Exception: ${e.toString()}');
      emit(AuthFailure(
          errMessage: FirebaseFailure.fromFirebaseException(e as Exception)
              .errMessage
              .toString()));
      rethrow;
    }
  }
}
