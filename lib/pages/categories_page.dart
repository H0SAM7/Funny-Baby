import 'package:flutter/material.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/widgets/custom_category.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});
  static String id = 'CategoriesPage';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    
    double childAspectRatio =
        (size.width / 2) / (size.height * .2); // Adjust aspect ratio
    //final s = S.of(context);
  
    List<String> CategoryAr = [
      "اولادي",
      "بناتي",
      "حديثي الولادة",
      "ملابس داخلية",
      "بيجامة",
      "اكسسوارات",
      "مصيف",
      "احذية",
      "سواريه",
    ];
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: childAspectRatio,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: CategoryAr.length,
        itemBuilder: (context, index) {
          return CustomCategory(
            name: CategoryAr[index],
          );
        },
      ),
    ));
  }
}
