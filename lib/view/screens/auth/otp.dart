import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/auth/otp_controller.dart';
import 'package:gradp2p/core/constants/colors.dart';
import 'package:gradp2p/view/widget/auth/custombuttonauth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class otp extends StatelessWidget {
  const otp({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    otpcontrollerImp controller = Get.put(otpcontrollerImp());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfff7f6fb),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 32,
            color: Colors.black54,
          ), // Leading arrow icon
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: Column(
              children: [
                Container(
                  width: width / 2,
                  height: height / 4,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/illustration-3.png',
                  ),
                ),
                SizedBox(
                  height: height / 25,
                ),
                const Text(
                  'Verification',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: height / 60,
                ),
                const Text(
                  "Enter your OTP code number",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height / 40,
                ),
                Container(
                  padding: EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      PinCodeTextField(
                        controller: controller.otpController,
                        // obscureText: secureTextB,
                        obscuringCharacter: '*', // Custom obscuring character
                        animationType: AnimationType.fade,
                        keyboardType: TextInputType.number,
                        appContext: context,
                        // controller: controller,
                        length: 4,
                        cursorHeight: 19,
                        enableActiveFill: true,
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          fieldWidth: 50,
                          inactiveColor: Colors.grey,
                          selectedColor: kColor1,
                          activeFillColor: kColor1,
                          selectedFillColor: kColor1,
                          inactiveFillColor: Colors.grey,
                          borderWidth: 1,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    
                      SizedBox(
                        height: height / 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                const Text(
                  "Didn't you receive any code?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 0,
                ),
                const Text(
                  "Resend New Code",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kColor1,
                  ),
                  textAlign: TextAlign.center,
                ),
                Custombuttonauth(
                    buttonName: "verify",
                    onPressed: () {
                      controller.login();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
