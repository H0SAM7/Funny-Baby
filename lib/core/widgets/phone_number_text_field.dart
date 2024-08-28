import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';

class PhoneNumberTextField extends StatefulWidget {
  const PhoneNumberTextField(
      {super.key,
      required this.label,
      required this.hint,
      this.onChanged,
      this.icon,
      this.controller,
      this.isRequired = true,
      this.validator});

  final TextEditingController? controller;
  final String label;
  final String hint;
  final Icon? icon;
  final bool isRequired;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  @override
  State<PhoneNumberTextField> createState() => _OptionalTextFieldState();
}

class _OptionalTextFieldState extends State<PhoneNumberTextField> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: TextFormField(
        controller: widget.controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'يرجى إدخال رقم الهاتف';
          } else if (value.length != 11) {
            return 'يرجى إدخال رقم هاتف صحيح مكون من 11 رقماً';
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
