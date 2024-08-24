import 'package:cloud_firestore/cloud_firestore.dart';
import 'product_model.dart'; // Import your ProductModel

class OrderModel {
  String orderId;
  ProductModel product;
  int quantity;
  String totalPrice;
  String customerName;
  String customerEmail;
  Timestamp orderDate;
  String status;

  OrderModel({
    required this.orderId,
    required this.product,
    required this.quantity,
    required this.totalPrice,
    required this.customerName,
    required this.customerEmail,
    required this.orderDate,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'product': product.toMap(), // Convert the product to a map
      'quantity': quantity,
      'totalPrice': totalPrice,
      'customerName': customerName,
      'customerEmail': customerEmail,
      'orderDate': orderDate,
      'status': status,
    };
  }

  factory OrderModel.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return OrderModel(
      orderId: doc.id,
      product: ProductModel.fromDocument(data['product']),
      quantity: data['quantity'],
      totalPrice: data['totalPrice'],
      customerName: data['customerName'],
      customerEmail: data['customerEmail'],
      orderDate: data['orderDate'],
      status: data['status'],
    );
  }
}
