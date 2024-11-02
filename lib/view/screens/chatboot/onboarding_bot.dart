import 'package:flutter/material.dart';
import 'package:gradp2p/view/screens/chatboot/chatBoot.dart';

class OnBoardingBot extends StatelessWidget {
  static const String routeName = "onboarding-bot";

  const OnBoardingBot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: const Text(' '),
      ),
      body: Container(
        alignment: Alignment.bottomCenter,
        margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    "Your AI Assistant",
                    style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                child: const Column(
                  children: [
                    Text(
                      "using this AI Assistant can help you in any problem you face in the app and help you find anything you want in the application",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                child: const Image(
                  image: AssetImage("assets/images/Rectangle 2.png"),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding: const EdgeInsets.all(8),
              ),
              child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
