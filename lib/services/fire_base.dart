import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:image_picker/image_picker.dart';

class FireBaseServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  Future<void> addProduct(ProductModel product) async {
    try {
      await _firestore.collection('products').add(product.toMap());
      log('adding done');
    } catch (e) {
      log('Error adding product: $e');
    }
  }

  Future<List<ProductModel>> getProducts() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('products').get();
      return querySnapshot.docs
          .map((doc) => ProductModel.fromDocument(doc))
          .toList();
    } catch (e) {
      log('Error getting products: $e');
      return [];
    }
  }

  Future<List<ProductModel>> getCategoryProducts(
    String category,
  ) async {
    try {
      List<ProductModel> list = await getProducts();
      List<ProductModel> categoryProducts = [];
      for (var product in list) {
        if (category == product.category) {
          categoryProducts.add(product);
        }
      }
      return categoryProducts;
    } catch (e) {
      log('Error getting products: $e');
      return [];
    }
  }
    Future<List<SaleModel>> getsales() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('sales').get();
      return querySnapshot.docs
          .map((doc) => SaleModel.fromDocument(doc))
          .toList();
    } catch (e) {
      log('Error getting sales: $e');
      return [];
    }
  }

  Future<void> updateProduct(ProductModel product) async {
    try {
      await _firestore
          .collection('products')
          .doc(product.code)
          .update(product.toMap());
    } catch (e) {
      log('Error updating product: $e');
    }
  }

 
Future<void> updateField(String fieldName, bool newValue, ProductModel productModel) async {

  await FirebaseFirestore.instance
      .collection('products')  
      .doc(productModel.code)
      .update({fieldName: newValue})
      .then((_) {
    log("Field updated successfully");
  }).catchError((error) {
    log("Error updating field: $error");
  });
}



Future<void> deleteProduct(String parcode) async {
  try {
    // Query the collection to find the document with the matching parcode
    QuerySnapshot querySnapshot = await _firestore
        .collection('products')
        .where('parcode', isEqualTo: parcode)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Get the document ID of the first matching document
      String docId = querySnapshot.docs.first.id;

      // Delete the document with the matching ID
      await _firestore.collection('products').doc(docId).delete();
      log('Product with parcode $parcode deleted successfully.');
    } else {
      log('No product found with parcode $parcode');
    }
  } catch (e) {
    log('Error deleting product: $e');
  }
}


  Future<String?> uploadImage(String fileName) async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        File file = File(pickedFile.path);

        Reference storageRef =
            _storage.ref().child('FunnyBabyimages/$fileName');

        UploadTask uploadTask = storageRef.putFile(file);

        TaskSnapshot snapshot = await uploadTask.whenComplete(() => {});

        String downloadUrl = await snapshot.ref.getDownloadURL();

        return downloadUrl;
      }
    } catch (e) {
      log('Error uploading image: $e');
    }
    return null;
  }

  Future<String?> getDownloadUrl(String filePath) async {
    try {
      String downloadUrl = await _storage.ref(filePath).getDownloadURL();
      return downloadUrl;
    } catch (e) {
      log('Error getting download URL: $e');
      return null;
    }
  }


Future<void> addSale(SaleModel sale) async {
    try {
      await _firestore.collection('sales').add(sale.toMap());
      log('adding done');
    } catch (e) {
      log('Error adding product: $e');
    }
  }
}
