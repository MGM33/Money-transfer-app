import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Username extends StatelessWidget {
  const Username({super.key});

  Future<String> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('name') ?? 'No Name';
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getUserName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text('Error loading user data');
        } else {
          return Text(
            snapshot.data!,
            style: const TextStyle(
              color: Color(0xFF5163BF),
              fontSize: 28,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w500,
              letterSpacing: 0.08,
            ),
          );
        }
      },
    );
  }
}
