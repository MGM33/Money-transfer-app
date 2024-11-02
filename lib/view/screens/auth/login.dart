import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/auth/login_controller.dart';
import 'package:gradp2p/core/functions/validInput.dart';
import 'package:gradp2p/view/widget/auth/Registerlinktext.dart';
import 'package:gradp2p/view/widget/auth/custombuttonauth.dart';
import 'package:gradp2p/view/widget/auth/customphonefield.dart';
import 'package:gradp2p/view/widget/auth/forgotpasstextlink.dart';
import 'package:gradp2p/view/widget/auth/logintitle.dart';
import 'package:gradp2p/view/widget/auth/custompasstextformfield.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    logincontrollerImp controller = Get.put(logincontrollerImp());
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.formstate,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height / 7),
                const Logintitle(),
                SizedBox(height: height / 6),
                //phone number field

                Customphonefield(
                  valid: (val) {
                    return validInput(val!, 11, 11, "phonenumber");
                  },
                  labeltext: "Phone Number ",
                  prefix: Icon(
                    Icons.mobile_friendly_rounded,
                  ),
                  mycontroller: controller.phoneNumber,
                ),

                //password field

                GetBuilder<logincontrollerImp>(
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
                //registr-signup route by text register now

                Forgotpasstextlink(
                  onTap: () {
                    controller.gotoforgetPass();
                  },
                ),

                SizedBox(
                  height: height / 7,
                ),

                //login button
                Custombuttonauth(
                    buttonName: "Login",
                    onPressed: () {
                      controller.Login();
                    }),
                CustomRegisterlinktext(onTap: () {
                  controller.goToSignup();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
