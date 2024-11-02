import 'package:flutter/material.dart';
import 'package:gradp2p/core/constants/colors.dart';

class Customtextformfield extends StatelessWidget {
  final String labeltext;
  final IconData iconData;
  final TextEditingController mycontroller;
  final String? Function(String?) valid;

  const Customtextformfield(
      {super.key,
      required this.labeltext,
      required this.iconData,
      required this.mycontroller,
      required this.valid});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        validator: valid,
        controller: mycontroller,
        decoration: InputDecoration(
          prefixIcon: Icon(iconData),
          labelText: labeltext,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: TextColor1),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
