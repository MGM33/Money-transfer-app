import 'package:flutter/material.dart';
import 'package:gradp2p/core/constants/colors.dart';

class Passtextformfield extends StatelessWidget {
  final String labeltext;
  final TextEditingController mycontroller;
  final String? Function(String?) valid;
  final bool obscureText;
  final void Function() onTapIcon;

  const Passtextformfield({
    super.key,
    required this.labeltext,
    required this.mycontroller,
    required this.valid,
    required this.obscureText,
    required this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        validator: valid,
        controller: mycontroller,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key_sharp),
          suffixIcon: IconButton(
              onPressed: onTapIcon,
              icon:
                  Icon(obscureText ? Icons.visibility_off : Icons.visibility)),

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
      ),
    );
  }
}
