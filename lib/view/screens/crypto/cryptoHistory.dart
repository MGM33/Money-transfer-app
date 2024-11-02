import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/view/widget/homeContainers/cryptoTransactionContainer.dart';

class CryptoHistory extends StatelessWidget {
  const CryptoHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Transactions'),
          centerTitle: true, // Center the title horizontally
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 32,
              color: Colors.black54,
            ), // Leading arrow icon
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [Container()],
              ),
              Expanded(
                child: ListView.builder(
                    //  physics: NeverScrollableScrollPhysics(),
                    // scrollDirection: Axis.vertical,
                    itemCount: 120,
                    itemBuilder: (context, index) {
                      return Cryptotransactioncontainer();
                    }),
              ),
            ],
          ),
        ));
  }
}
