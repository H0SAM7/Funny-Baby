import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String code;
  String parcode;
  String title;
  String price;
  String description;
  String category;
  String image;
  String size;
  int count;
  String gender;
  bool cart;
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

  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
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
}

class SaleModel {
  String sale, image;
  SaleModel({required this.sale, required this.image});
  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'sale': sale,
      'image': image,
    };
  }

  factory SaleModel.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return SaleModel(sale: data['sale'], image: data['image']);
  }
}


//   factory ProductModel.fromjson(json) {
//     return ProductModel(
//         id: json['id'] ,
//         title: json['title'], 
//         price: (json['price']).toString(),
//         description: json['description'] ,
//         category: json['category'] ,
//         image: json['image'] ,

//      rating: json['rating'] == null
//             ? null
//             : RatingModel.fromjson(json['rating'])
//        );
//   }
// }

// class RatingModel {
//   final String rate;
//   final int count;
//   RatingModel({required this.rate, required this.count});
//   factory RatingModel.fromjson(json) {
//     return RatingModel(rate: json['rate'].toString(), count: json['count']);
//   }
// 
