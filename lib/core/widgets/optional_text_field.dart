import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';

class OptionalTextField extends StatefulWidget {
  const OptionalTextField({
    super.key,
    required this.label,
    required this.hint,
    this.onChanged,
    this.icon,
    this.controller,
    this.isRequired = true, 
  });

  final TextEditingController? controller;
  final String label;
  final String hint;
  final Icon? icon;
  final bool isRequired; 
  final Function(String)? onChanged;

  @override
  State<OptionalTextField> createState() => _OptionalTextFieldState();
}

class _OptionalTextFieldState extends State<OptionalTextField> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: TextFormField(
        controller: widget.controller,
        validator: (data) {
          if (widget.isRequired && (data == null || data.isEmpty)) {
            return 'Field is required';
          }
          return null;
        },
        onChanged: widget.onChanged,
        style: TextStyle(
          color: !isDarkMode ? Colors.black : Colors.white,
          fontFamily: 'Inter',
        ),
        cursorColor: blueColor,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          prefixIcon: widget.icon,
          labelText: widget.label,
          labelStyle: TextStyle(
            color: !isDarkMode ? blueColor : moveColor,
            fontFamily: 'Inter',
          ),
          hintText: widget.hint,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: 'Inter',
          ),
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
        ),
      ),
    );
  }
}

final outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: blueColor),
  borderRadius: const BorderRadius.all(Radius.circular(16)),
);
