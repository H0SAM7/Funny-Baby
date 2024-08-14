
import 'package:flutter/material.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/features/home/presentation/views/product_details.dart';
import 'package:funny_baby/helper/helper_functions.dart';
import 'package:funny_baby/services/fire_base.dart';
import 'package:funny_baby/widgets/custom_loading_indecator.dart';


// ignore: camel_case_types
class Catogery_widget extends StatelessWidget {
 const Catogery_widget({
    super.key,
    required this.categoryName,
  });

 final String categoryName;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool isarabic = isArabic(context);
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          Align(
            alignment: !isarabic ? Alignment.topLeft : Alignment.topRight,
     
              child: Text(
                categoryName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
       
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
                0, 10, 0, 10), // left, top, right, bottom
            child: SizedBox(
              height: size.height * .2,
              width: size.width,
              child: FutureBuilder(
                  future: FireBaseServices().getCategoryProducts(
                      isarabic ? categoryName : catWithAr(categoryName)),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return MyWidget(productModel: snapshot.data![index]);
                        },
                      );
                    } else {
                      return const CustomLoadingIndicator();
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }

  String catWithAr(String cat) {
    switch (cat) {
      case 'boys':
        return 'اولادي';
      case 'girls':
        return 'بناتي';
      case 'dresses':
        return 'فساتين';
      case 'evening_wear':
        return 'سواريه';
      case 'shoes':
        return 'احذية';
      case 'underwear':
        return 'ملابس داخلية';
      case 'boys_suits':
        return 'اطقم اولادي';
      case 'pajamas':
        return 'بيجامة';
      case 'accessories':
        return 'اكسسوارات';
      default:
        return 'مصيف'; // Default case for any unknown category
    }
  }
}

// ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: catt.length,
//             itemBuilder: (context, index) {
//               return catt[index] ;

//             },
//           )

// ignore: must_be_immutable
class MyWidget extends StatelessWidget {
  MyWidget({super.key, required this.productModel});

  ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailsPage.id, arguments: productModel);
      },
      child: Card(
          //  clipBehavior: Clip.none,
          elevation: 0,
          margin: const EdgeInsets.all(10),
          child: Card(
            elevation: 2,
            child: Image.network(
              productModel.image,
              height: size.height * .5,
              width: size.width * .35,
              fit: BoxFit.scaleDown,
              color: Colors.white
                  .withOpacity(0.09), // Apply color filter with transparency
              colorBlendMode: BlendMode.srcOver,
            ),
          )),
    );
  }
}


