import 'package:cloud_firestore/cloud_firestore.dart';
import 'product_model.dart';

class OrderModel {
  String orderId;
  List<ProductModel> products; // List of products
 // String totalPrice;
  String customerName;
  String customerEmail;
  String customerAddress;
  String customerPhone;
  String customerAddressCenter;
//String status;

  OrderModel({
    required this.orderId,
    required this.products,
  // required this.totalPrice,
    required this.customerName,
    required this.customerEmail,
    required this.customerAddress,
    required this.customerAddressCenter,
    required this.customerPhone,
   // required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'products': products.map((product) => product.toMap()).toList(), 
    //  'totalPrice': totalPrice,
      'customerName': customerName,
      'customerEmail': customerEmail,
      'customerAddress': customerAddress,
      'customerAddressCenter': customerAddressCenter,
      'customerPhone': customerPhone,
      
     // 'status': status,
    };
  }

  factory OrderModel.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return OrderModel(
      orderId: doc.id,
      products: (data['products'] as List).map((productData) => ProductModel.fromDocument(productData)).toList(),
      //totalPrice: data['totalPrice'],
      customerName: data['customerName'],
      customerEmail: data['customerEmail'],
      customerAddress: data['customerAddress'],
      customerAddressCenter: data['customerAddressCenter'],
      customerPhone: data['customerPhone'],
      //status: data['status'],
    );
  }
}
