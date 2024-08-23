import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/features/home/presentation/views/category_products_view.dart';
import 'package:go_router/go_router.dart';


class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    //  final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        
        GoRouter.of(context).push('/${CategoryProductsView.id }', extra:name);

      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          decoration: BoxDecoration(
              color: mainColor,
              image: DecorationImage(
                  image: AssetImage("assets/Images/$name.jpg"),
                  fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
