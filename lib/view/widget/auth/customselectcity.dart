import 'package:flutter/material.dart';
import 'package:gradp2p/core/constants/colors.dart';

class Customselectcity extends StatelessWidget {
  const Customselectcity({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: DropdownButtonFormField(
        
        validator: (value) {
          if (value == null) {
            return 'City is required';
          } else {
            print("valid");
          }
          return null;
        },
        isExpanded: true,
        decoration: InputDecoration(
          labelText: "Select your city",
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: TextColor1),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        items: <String>['Cairo', 'Alexandria', 'Giza', 'Ismailia']
            .map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
            ),
          );
        }).toList(),
        onChanged: (value) {
          //
        },
      ),
    );
  }
}
