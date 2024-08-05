
import 'package:flutter/material.dart';
import 'package:funny_baby/generated/l10n.dart';

// ignore: must_be_immutable
class CustomDropDown extends StatefulWidget {
  CustomDropDown({required this.MenuList,required this.onChanged});
   List<String> MenuList;
    final ValueChanged<String?> onChanged;

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  
  String? selectedCategory;
 

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedCategory,
      hint: Text(S.of(context).Select_category),
      items: widget.MenuList.map((String Item) {
        return DropdownMenuItem<String>(
          value: Item,
          child: Text(Item),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          selectedCategory = newValue;
        });
        widget.onChanged(newValue);
      },
    );
  }
}