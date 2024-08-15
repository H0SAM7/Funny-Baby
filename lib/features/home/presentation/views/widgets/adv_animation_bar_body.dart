
import 'package:flutter/material.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/adv_animation_bar.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/adv_item.dart';

class AdvarticementsBody extends StatelessWidget {
  const AdvarticementsBody({
    super.key,
    required PageController pageController,
    required this.widget,
  }) : _pageController = pageController;

  final PageController _pageController;
  final AdvarticementsAnimationBar widget;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: <Widget>[
     
        AdvItem(
         
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
              image: const DecorationImage(image: AssetImage('assets/Images/offer.jpg'),
              fit: BoxFit.fill,
              )
            ),
          ),
        ),
        AdvItem(
         
          color: widget.color!,
          image: widget.image!,
          text: widget.text!,
        ),
      ],
    );
  }
}