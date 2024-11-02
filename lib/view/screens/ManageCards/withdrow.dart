import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/ManageCards/Withdrow_controller.dart';
import 'package:gradp2p/core/constants/colors.dart';
import 'package:gradp2p/core/functions/validInput.dart';
import 'package:gradp2p/view/widget/auth/custombuttonauth.dart';
import 'package:gradp2p/view/widget/balanceWalletContainer.dart';
import 'package:gradp2p/view/widget/send&recieve/customAmountField.dart';

class Withdrow extends StatelessWidget {
  final WithdrowControllerImp controller = Get.put(WithdrowControllerImp());
  Withdrow({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Withdrow',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Balancewalletcontainer(),
            Divider(
              thickness: 3,
            ),
            Container(
              height: height * 0.7 / 3,
              decoration: ShapeDecoration(
                color: schafoldGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Form(
                key: controller.formstate,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        "enter Withdrow amount",
                        style: TextStyle(
                          color:
                              Colors.black, // Change to your `TextColor2` color
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: CustomAmountfield(
                          valid: (val) {
                            return validInput(val!, 1, 6, "amount");
                          },
                          labeltext: "Enter Amount",
                          prefix: Icon(
                            Icons.picture_in_picture_outlined,
                          ),
                          mycontroller: controller.amount,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Custombuttonauth(
                buttonName: "Confirm",
                onPressed: () {
                  controller.Withdrow();
                })
          ],
        ),
      ),
    );
  }
}
