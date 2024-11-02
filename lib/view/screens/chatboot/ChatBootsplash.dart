
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:gradp2p/view/screens/chatboot/onboarding_bot.dart';


class SplashBot extends StatefulWidget {
  static const String routeName = "splash-bot";

  const SplashBot({super.key});

  @override
  State<SplashBot> createState() => _SplashBotState();
}

class _SplashBotState extends State<SplashBot> {
@override
void initState(){
  super.initState();
  Timer(const Duration(seconds: 3),
  ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingBot()))
  );


}

  @override
  Widget build(BuildContext context) {

    return const Scaffold(

      body: Image(
        image: AssetImage("assets/images/SplashBot.png") ,
        fit: BoxFit.fill,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
