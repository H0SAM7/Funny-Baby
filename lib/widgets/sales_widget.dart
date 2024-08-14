import 'package:flutter/material.dart';
import 'package:funny_baby/core/models/product_model.dart';


class SalesWidget extends StatelessWidget {
  final SaleModel sale;

  const SalesWidget({super.key, required this.sale});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          left: size.width * .0188,
          right: size.width * .0188,
          bottom: size.height * .05),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Container(
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(sale.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.1)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            // Positioned(
            //   bottom: 20,
            //   left: 20,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         sale.sale,
            //         style: TextStyle(
            //           fontSize: 24,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.white,
            //         ),
            //       ),

            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
