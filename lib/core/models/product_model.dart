import 'package:hive/hive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'product_model.g.dart'; // This file will be generated by Hive

@HiveType(typeId: 0)
class ProductModel extends HiveObject {
  @HiveField(0)
  String code;

  @HiveField(1)
  String parcode;

  @HiveField(2)
  String title;

  @HiveField(3)
  String price;

  @HiveField(4)
  String description;

  @HiveField(5)
  String category;

  @HiveField(6)
  String image;

  @HiveField(7)
  String size;

  @HiveField(8)
  int count;

  @HiveField(9)
  String gender;

  @HiveField(10)
  bool cart;

  @HiveField(11)
  double discount;

  ProductModel({
    required this.parcode,
    required this.code,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.size,
    required this.count,
    required this.gender,
    required this.cart,
    required this.discount,
  });

  // Convert Firestore document to ProductModel
  factory ProductModel.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ProductModel(
      code: doc.id,
      parcode: data['parcode'],
      title: data['name'],
      price: data['price'],
      description: data['description'],
      category: data['category'],
      image: data['imageUrl'],
      size: data['size'],
      count: data['count'],
      gender: data['gender'],
      cart: data['cart'],
      discount: data['discount'],
    );
  }
  factory ProductModel.fromMap(Map<String, dynamic> data) {
    return ProductModel(
      code: data['parcode'],
      parcode: data['parcode'],
      title: data['name'],
      price: data['price'],
      description: data['description'],
      category: data['category'],
      image: data['imageUrl'],
      size: data['size'],
      count: data['count'],
      gender: data['gender'],
      cart: data['cart'],
      discount: data['discount'],
    );
  }
  // Convert ProductModel to map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'name': title,
      'parcode': parcode,
      'price': price,
      'description': description,
      'category': category,
      'imageUrl': image,
      'size': size,
      'count': count,
      'gender': gender,
      'cart': cart,
      'discount': discount,
    };
  }
}
