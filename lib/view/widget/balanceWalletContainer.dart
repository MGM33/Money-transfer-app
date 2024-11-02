import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/wallet_controller.dart';

class Balancewalletcontainer extends StatelessWidget {
    final WalletBalanceControllerImp controller =
      Get.put(WalletBalanceControllerImp());
   Balancewalletcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Wallet Balance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              children: [
                Obx(
                  () => Text(
                    '${controller.balance.value.toStringAsFixed(2)} LE',
                     style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
                
            
              ],
            ),
          ),
        ],
      ),
    );
  }
}
