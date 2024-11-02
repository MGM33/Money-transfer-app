import 'package:flutter/material.dart';

class Forgotpasstextlink extends StatelessWidget {
  final Function() onTap;
  const Forgotpasstextlink({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          GestureDetector(
            onTap: onTap,
            child: const Text("Forgot Password ?",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )),
          ),
        ],
      ),
    );
  }
}
