
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> readDocument() async {
  // Initialize Firestore instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Reference to the collection
  CollectionReference collectionRef = firestore.collection('crashed');

  // Get the documents from the collection
  QuerySnapshot querySnapshot = await collectionRef.get();

  // Check if there are any documents
  if (querySnapshot.docs.isNotEmpty) {
    // Assuming you want to return the value from the first document
    DocumentSnapshot doc = querySnapshot.docs.first;
    bool isCrashed = doc['isCrashed'];
    log('Boolean field value: $isCrashed');
    return isCrashed;
  } else {
    // Handle the case where there are no documents
    log('No documents found in the collection.');
    return false; // or any default value you prefer
  }
}
