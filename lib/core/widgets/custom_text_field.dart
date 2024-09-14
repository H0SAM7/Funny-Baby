import 'package:flutter/material.dart';
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
      this.onTap,
          this.maxline = 1,
      });
  final TextEditingController? controller;
  final String label;
  final String hint;
  final int maxline;
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
          maxLines: widget.maxline,
          showCursor: true,
          obscureText: widget.hide,
          controller: widget.controller,
          validator: (data) {
            if (data!.isEmpty) {
              return 'Field is required';
            }
            return null;
          },
          onChanged: widget.onchage,
          style: TextStyle(
            color: !isDarkMode ? Colors.black : Colors.white,
            fontFamily: 'Inter',
          ),
          cursorColor: blueColor,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                    ),)
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
              style: TextStyle(
                color: !isDarkMode ? blueColor : moveColor,
                fontFamily: 'Inter',
              ),
            ),
            hintText: widget.hint,
            fillColor: blueColor,
            hoverColor: blueColor,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontFamily: 'Inter',
            ),
            border: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
          )),
    );
  }
}

final outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: blueColor),
  borderRadius: const BorderRadius.all(Radius.circular(16)),
);
