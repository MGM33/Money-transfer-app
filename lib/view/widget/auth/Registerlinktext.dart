import 'package:flutter/material.dart';

class CustomRegisterlinktext extends StatelessWidget {
  final Function() onTap;
  const CustomRegisterlinktext({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("NEW?",
              style: TextStyle(
                color: Color(0xff2f1155),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              )),
          GestureDetector(
            onTap: onTap,
            child: const Text("Register Now.",
                style: TextStyle(
                  color: Color(0xff5063bf),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                )),
          ),
        ],
      ),
    );
  }
}
