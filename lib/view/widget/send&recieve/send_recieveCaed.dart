import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/auth/userControllers/user_controller.dart';

class send_recieveCard extends StatelessWidget {
  const send_recieveCard({super.key});
  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        width: 340,
        height: 80,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFF5163BF)),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                height: 60,
                width: 60,
                child: Image.asset("assets/images/logo.png")),
            // SizedBox(
            //   width: 10,
            // ),
            Obx(() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // SizedBox(height: 10,),
                  Text(
                    userController.smartEmail.value,
                    style: TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 12,
                      fontFamily: 'Actor',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.04,
                    ),
                  ),
                 
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
