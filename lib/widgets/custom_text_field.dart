import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:funny_baby/constants.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
      required this.label,
      required this.hint,
      this.onchage,
      this.hide = false,
      this.icon,
      this.passicon = false,
      this.onSaved,
      this.controller,
      this.onTap});
      final TextEditingController? controller;
  final String label;
  final String hint;
  bool hide;
  Icon? icon;
  bool passicon;
  Function(String)? onchage;
  VoidCallback? onTap;
  Function(String?)? onSaved;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
     bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: TextFormField(
       
          onSaved: widget.onSaved,
          showCursor: true,
          obscureText: widget.hide,
          controller: widget.controller,
          validator: (data) {
            if (data!.isEmpty) {
              return 'Field is required';
            }
          },
          
          onChanged: widget.onchage,
          style: TextStyle(color:!isDarkMode? Colors.black:Colors.white, fontFamily: 'Inter',),
          cursorColor: blueColor,
          decoration: InputDecoration(
            contentPadding:const EdgeInsets.symmetric(vertical: 20,horizontal: 20) ,
            prefixIcon: widget.icon,
            suffixIcon: widget.hide
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        widget.hide = !widget.hide;
                      });
                    },
                    icon: Icon(
                      Icons.visibility,
                      color: blueColor,
                    ))
                : widget.passicon
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            widget.hide = !widget.hide;
                          });
                        },
                        icon: const Icon(Icons.visibility_off))
                    : null,
            label: Text(
              widget.label,
              style: TextStyle(color:!isDarkMode? blueColor:moveColor, fontFamily: 'Inter',),
            ),
            hintText: widget.hint,
            fillColor: blueColor,
            hoverColor: blueColor,
            hintStyle: const TextStyle(color: Colors.grey, fontFamily: 'Inter',),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: blueColor),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: blueColor),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: blueColor),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
          )),
    );
  }
}
