import 'package:flutter/material.dart';

class Custombuttonauth extends StatelessWidget {
  final String buttonName;

  final Function() onPressed;
  const Custombuttonauth({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Color(0xff5063bf),
          //elevation: 10,
          minimumSize: Size(170, 50)),
      child: Text(buttonName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          )),
    );
  }
}
