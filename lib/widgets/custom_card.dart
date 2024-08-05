import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/models/product_model.dart';
import 'package:funny_baby/pages/product_details.dart';
import 'package:google_fonts/google_fonts.dart';


// ignore: must_be_immutable
class CustomCard extends StatefulWidget {
  CustomCard({
    super.key,
    required this.productModel,
    this.details = true,
  });

  bool details;
  bool favo = false;
  final ProductModel productModel;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    // bool isarabic = isArabic(context);
    // final s = S.of(context);
    // var cubit = BlocProvider.of<GetProductCubit>(context);
    var size = MediaQuery.of(context).size;
    double cardPadding = size.width * 0.02; // Responsive padding

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailsPage.id,
            arguments: widget.productModel);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 3,
        margin: EdgeInsets.all(cardPadding),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            decoration: BoxDecoration(
              color: isDarkMode
                  ? Colors.white
                  : const Color.fromARGB(115, 255, 255, 255),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height * .41,
                  width: size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      image: NetworkImage(widget.productModel.image),
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(cardPadding),
                  child: Align(
                    // alignment: isarabic?Alignment.centerRight:Alignment.centerLeft,
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _truncateText(widget.productModel.title, 4),
                            style: TextStyle(
                              color: blueColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.amiri().fontFamily,
                              // fontFamily: GoogleFonts.amiri().fontFamily,
                              fontSize: 18,
                            ),
                            maxLines: 1,
                          ),
                          Text(
                            " \$ ${widget.productModel.price}",
                            style: TextStyle(
                              fontSize: 18,
                              color: blueColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _truncateText(String text, int maxWords) {
    final words = text.split(' ');
    if (words.length <= maxWords) {
      return text;
    } else {
      return words.take(maxWords).join(' ') + '...';
    }
  }

  double discount(double price, discount) {
    return price - (price * discount / 100);
  }
}
