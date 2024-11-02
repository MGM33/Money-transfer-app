import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/colors.dart';
import 'package:gradp2p/core/services/services.dart';
import 'package:gradp2p/routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            color: TextColor1,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
     
      getPages: routes,
    );
  }
}
