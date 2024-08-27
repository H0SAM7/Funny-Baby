// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:funny_baby/core/models/order_model.dart';

// class OrdersView extends StatelessWidget {
//   const OrdersView({super.key});

//   Future<List<OrderModel>> _fetchOrders() async {
//     try {
//       // Reference to the Firestore collection
//       CollectionReference ordersCollection = FirebaseFirestore.instance.collection('orders');

//       // Fetch all documents from the collection
//       QuerySnapshot querySnapshot = await ordersCollection.get();

//       // Convert documents to OrderModel
//       List<OrderModel> orders = querySnapshot.docs.map((doc) => OrderModel.fromDocument(doc)).toList();

//       return orders;
//     } catch (e) {
//       print("Error fetching orders: $e");
//       return [];
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<OrderModel>>(
//       future: _fetchOrders(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }

//         if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         }

//         if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return Center(child: Text('No orders available'));
//         }

//         List<OrderModel> orders = snapshot.data!;

//         return ListView.builder(
//           itemCount: orders.length,
//           itemBuilder: (context, index) {
//             OrderModel order = orders[index];
//             return ListTile(
//               title: Text(order.customerName),
//               subtitle: Text('Order ID: ${order.orderId}'),
//               onTap: () {
//                 // Handle tap (e.g., navigate to order details)
//               },
//             );
//           },
//         );
//       },
//     );
//   }
// }
