import 'package:flutter/material.dart';

class Logintitle extends StatelessWidget {
  const Logintitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Welcome Back ",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff2f1155),
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "to ",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff2f1155),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Smart Pay",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff5164bf),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
