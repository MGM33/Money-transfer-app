import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';
import 'package:gradp2p/view/widget/send&recieve/customConfirmButton.dart';

class Navigatetoqrgenerate extends StatelessWidget {
  const Navigatetoqrgenerate({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Customconfirmbutton(
            buttonName: 'Scan code',
            onPressed: () {
              Get.toNamed(AppRoute.ScanQRScreen);
            },
          ),
        ],
      ),
    );
  }
}
