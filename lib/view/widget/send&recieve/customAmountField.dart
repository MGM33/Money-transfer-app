import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradp2p/core/constants/colors.dart';

class CustomAmountfield extends StatelessWidget {
  final String labeltext;
  final Widget prefix;

  final TextEditingController mycontroller;

  final String? Function(String?) valid;
  final String? Function(String?)? onnchanged;

  const CustomAmountfield(
      {super.key,
      required this.labeltext,
      required this.mycontroller,
      required this.prefix,
      required this.valid,
      this.onnchanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        validator: valid,
        controller: mycontroller,
        onChanged: onnchanged,
        decoration: InputDecoration(
          prefixIcon: prefix,
          // Icon(iconData),

          labelText: labeltext,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: TextColor1),
            borderRadius: BorderRadius.circular(15),
          ),
          // border: ,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
         // FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(16),
        ], // Only numbers can be entered
      ),
    );
  }
}
