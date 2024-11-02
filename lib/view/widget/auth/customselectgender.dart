import 'package:flutter/material.dart';
import 'package:gradp2p/core/constants/colors.dart';

class Customselectgender extends StatelessWidget {
  const Customselectgender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: DropdownButtonFormField(
        validator: (value) {
          if (value == null) {
            return 'Gender is required';
          } else {
            print("valid");
          }
          return null;
        },
        isExpanded: true,
        decoration: InputDecoration(
          labelText: "Select your gender",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: TextColor1),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        items: <String>['Female', 'Male'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
            ),
          );
        }).toList(),
        onChanged: (value) {},
      ),
    );
  }
}
