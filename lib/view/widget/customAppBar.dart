import 'package:flutter/material.dart';

class Customappbar extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const Customappbar({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true, // Center the title horizontally
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          size: 32,
          color: Colors.black54,
        ), // Leading arrow icon
        onPressed: onPressed,
      ),
    );
  }
}
