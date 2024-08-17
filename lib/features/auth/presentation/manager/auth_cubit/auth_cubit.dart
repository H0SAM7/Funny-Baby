import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funny_baby/core/helper/auth_helper.dart';
import 'package:funny_baby/core/helper/shared_pref.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

  Future<void> registerUser(
      String email, String password, String username) async {

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
         
          log('User account created successfully.');
        } else {
         
          await user.delete();
          log('Email verification failed. Please verify your email.');
        }
      }
    } catch (e) {

    }
  }

  Future<void> loginUser(String email, String password) async {
   
    try {
      
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
     
      log('The Login Successful');
    } catch (e) {
    
    }
  }


  Future<void> deleteUser() async {
    try {
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .delete();
        log("Document with UID ${user!.uid} deleted successfully");
        await user!.delete();
        // Account deletion successful
        log("Account deleted successfully.");
      }
    } catch (e) {
      // Handle errors here, like reauthentication requirements
      log("Error deleting account: $e");
    }
  }



  Future<void> logout() async {
    try {
      await auth.signOut();
         await SharedPreference().setBool("isLoggedIn", false);
      log("User logged out successfully.");
    } catch (e) {
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

 
Future<UserCredential> signInWithGoogle() async {
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
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  } catch (e) {
    // Handle different types of exceptions
    if (e is FirebaseAuthException) {
      log('FirebaseAuthException: ${e.message}');
    } else {
      log('Exception: ${e.toString()}');
    }
    // Optionally rethrow or handle the error as needed
    rethrow;
  }
}









}
