import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/auth/forgotPassword/phoneNumber_controller.dart';
import 'package:gradp2p/core/functions/validInput.dart';
import 'package:gradp2p/view/widget/auth/custombuttonauth.dart';
import 'package:gradp2p/view/widget/auth/customphonefield.dart';

class forgetPassPhone extends StatelessWidget {
  const forgetPassPhone({super.key});

  @override
  Widget build(BuildContext context) {
    phoneNumbercontrollerImp controller = Get.put(phoneNumbercontrollerImp());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff7f6fb),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/illustration-2.png',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Forgot password',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Inter Your phone Number to continue",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 28,
              ),
              Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Form(
                  key: controller.formstate,
                  child: Column(
                    children: [
                      Customphonefield(
                        valid: (val) {
                          return validInput(val!, 11, 111, "phone number");
                        },
                        labeltext: "phone Number",
                        mycontroller: controller.phoneNumber,
                        prefix: const Icon(
                          Icons.mobile_friendly_rounded,
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Custombuttonauth(
                          buttonName: "Get Code",
                          onPressed: () {
                            controller.gosendOTP();
                          })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
