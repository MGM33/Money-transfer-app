import 'package:flutter/material.dart';

class Loginlinktext extends StatelessWidget {
  final Function() onTap;
  const Loginlinktext({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Already have an acount?",
              style: TextStyle(
                color: Color(0xff2f1155),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              )),
          GestureDetector(
            onTap: onTap,
            child: const Text(" Login ",
                style: TextStyle(
                  color: Color(0xff5063bf),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                )),
          ),
        ],
      ),
    );
  }
}
