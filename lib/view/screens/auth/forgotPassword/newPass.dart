import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/auth/forgotPassword/newPass_controller.dart';
import 'package:gradp2p/core/constants/colors.dart';
import 'package:gradp2p/core/functions/validInput.dart';
import 'package:gradp2p/view/widget/auth/custombuttonauth.dart';
import 'package:gradp2p/view/widget/auth/custompasstextformfield.dart';

class Newpass extends StatelessWidget {
  const Newpass({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    NewpassControllerImp controller = Get.put(NewpassControllerImp());
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.formstate,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height / 7),
                const Column(
                  children: [
                    Text(
                      "Set a new password ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff2f1155),
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "set a new password for your account  ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: TextColor2,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height / 6),
                //phone number field
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "set password ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff2f1155),
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox()
                    ],
                  ),
                ),
                GetBuilder<NewpassControllerImp>(
                  builder: (controller) => Passtextformfield(
                    valid: (val) {
                      return validInput(val!, 5, 15, "password");
                    },
                    labeltext: "Password",
                    mycontroller: controller.password,
                    obscureText: controller.isshowpassword,
                    onTapIcon: () {
                      controller.showPassword();
                    },
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "confirm password ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff2f1155),
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox()
                    ],
                  ),
                ),
                //password field

                GetBuilder<NewpassControllerImp>(
                  builder: (controller) => Passtextformfield(
                    valid: (val) {
                      return validInput(val!, 5, 15, "password");
                    },
                    labeltext: "confirm Password",
                    mycontroller: controller.confirmPassword,
                    obscureText: controller.isshowpassword2,
                    onTapIcon: () {
                      controller.showPassword2();
                    },
                  ),
                ),
                //registr-signup route by text register now

                SizedBox(
                  height: height / 11,
                ),

                //login button
                Custombuttonauth(
                    buttonName: "Save",
                    onPressed: () {
                      controller.savenewpass();
                    }),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      controller.goTologin();
                    },
                    child: const Text("Back to login",
                        style: TextStyle(
                          color: TextColor1,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
