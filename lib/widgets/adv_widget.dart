import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';
import 'dart:async';



// ignore: must_be_immutable
class Advarticements extends StatefulWidget {
  Advarticements({super.key, this.color, this.image, this.text});
  static String id = 'TestPage';
  String? image, text;
  Color? color;
  @override
  State<Advarticements> createState() => _AdvarticementsState();
}

class _AdvarticementsState extends State<Advarticements> {
  final PageController _pageController = PageController();
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   // final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
       
          adv(
           
            color: widget.color!,
            image: widget.image!,
            text: widget.text!,
          ),
          // adv(
        
          //   color: widget.color!,
          //   image: widget.image!,
          //   text:' خصم 10%',
          // ),
             Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Container(
              decoration: BoxDecoration(
                //color: widget.color,
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(image: AssetImage('assets/Images/offer.jpg'),
                fit: BoxFit.fill,
                )
              ),
            ),
          ),
          adv(
           
            color: widget.color!,
            image: widget.image!,
            text: widget.text!,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class adv extends StatelessWidget {
  adv(
      {super.key,

      required this.color,
      required this.image,
      required this.text});

 
  String image, text;
  Color color;

  @override
  Widget build(BuildContext context) {
       final size = MediaQuery.of(context).size;
       var padding = MediaQuery.paddingOf(context);
double newheight = size.height - padding.top - padding.bottom;
   // bool isarabic=isArabic(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(30),
              
            ),
          ),
          Positioned(
            top:size.height*-.035,
            left: 0,
            child: Image.asset(
              image,
           height: newheight * .18,
            ),
          ),
          Positioned(
            left: size.width*.08,
            top: newheight*.05,
            right: size.width*.1,
            
            child: Text(text,style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: blueColor
            ),))
        ],
      ),
    );
  }
}
