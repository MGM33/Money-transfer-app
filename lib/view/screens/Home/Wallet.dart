import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/crypto/ownedcrypto_Controller.dart';
import 'package:gradp2p/controller/wallet_controller.dart';
import 'package:gradp2p/view/widget/balanceWalletContainer.dart';
import 'package:gradp2p/view/widget/CryptoComponents/owneedCryptoContainer.dart';

class Wallet extends StatelessWidget {
  Wallet({super.key});

 // final WalletController controller = Get.put(WalletController());

  @override
  Widget build(BuildContext context) {
    final OwnedcryptoControllerImp cryptoController =
        Get.put(OwnedcryptoControllerImp());
         cryptoController.GetOwnedCrypto();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Wallet',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Balancewalletcontainer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Wallets",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Owneedcryptocontainer(),
          ],
        ),
      ),
    );
  }
}
