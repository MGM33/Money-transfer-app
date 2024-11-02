import 'package:flutter/material.dart';

class Customconfirmbutton extends StatelessWidget {
  final String buttonName;

  final Function() onPressed;
  const Customconfirmbutton({
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
          minimumSize: Size(140, 50)),
      child: Text(buttonName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          )),
    );
  }
}
