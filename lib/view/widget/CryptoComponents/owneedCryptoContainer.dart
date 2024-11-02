import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/crypto/ownedcrypto_Controller.dart';

class Owneedcryptocontainer extends StatelessWidget {
  final OwnedcryptoControllerImp controller =
      Get.put(OwnedcryptoControllerImp());
  static const Map<String, String> currentImage = {
    'bitcoin': 'assets/images/crypto/Froyoshark-Enkel-Bitcoin.48.png',
    'ethereum': 'assets/images/crypto/ethereum.jpeg',
    'ripple':
        'assets/images/crypto/ripple-xrp-token-symbol-cryptocurrency-logo-coin-vector-38102423.avif',
    'tether': 'assets/images/crypto/tether.png',
    'binancecoin': 'assets/images/crypto/binancecoin.png',
    'solana': 'assets/images/crypto/download.jpeg',
    'staked-ether': 'assets/images/crypto/download (1).png',
    'usd_coin': 'assets/images/crypto/usd-coin.jpeg',
    // Add more constants for each cryptocurrency
  };

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.ownedCrypto.isEmpty) {
        return Center(child: CircularProgressIndicator());
      } else {
        return Expanded(
          child: ListView.builder(
              itemCount: controller.ownedCrypto.length,
              itemBuilder: (context, index) {
                var ownedCrypto = controller.ownedCrypto[index];
                String cryptoName = ownedCrypto['crypto'] ?? 'unknown';
                String cryptoImage = currentImage[cryptoName] ??
                    'assets/images/crypto/Froyoshark-Enkel-Bitcoin.48.png';

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                                 
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(6),
                                child: Image.asset(cryptoImage),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cryptoName,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                Text(
                                  ownedCrypto['amount'].toString(),
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      ownedCrypto['totalAmount'].toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        );
      }
    });
  }
}
