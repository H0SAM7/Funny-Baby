import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore package
import 'package:funny_baby/core/helper/shared_pref.dart';

class TechnicalSupportMessages {
  final FirebaseFirestore firestore = FirebaseFirestore.instance; // Firestore instance

  Future<void> technicalSupportMessage({
    required String title,
    required String content,
    required String phoneNumber,
  }) async {
    try {
      // Get email from shared preferences asynchronously
      var email = await SharedPreference().getString('email');

      Map<String, dynamic> problemData = {
        'title': title,
        'content': content,
        'phoneNumber': phoneNumber,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(), // Add timestamp
      };

      // Add the document to Firestore
      await firestore.collection('Technical Support').add(problemData);

      log(' send successfully');
    } catch (e) {
      log('Error sending message: $e');
    }
  }
}
