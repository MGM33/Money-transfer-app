import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/colors.dart';
import 'package:gradp2p/data/model/coinModel.dart';
import 'package:gradp2p/view/widget/CryptoComponents/item3.dart';

import 'package:http/http.dart' as http;

class CryptoMarket extends StatefulWidget {
  const CryptoMarket({super.key});

  @override
  State<CryptoMarket> createState() => _CryptoMarketState();
}

class _CryptoMarketState extends State<CryptoMarket> {
  @override
  void initState() {
    getCoinMarket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Market'),
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
      body: Column(
        children: [
          SizedBox(
            height: myHeight * 0.01,
          ),
          // searchField(),
          // SizedBox(
          //   height: myHeight * 0.01,
          // ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: myWidth * 0.03),
              child: isRefreshing == true
                  ? Center(
                      child: CircularProgressIndicator(
                        color: kColor1,
                      ),
                    )
                  : coinMarket == null || coinMarket!.length == 0
                      ? Padding(
                          padding: EdgeInsets.all(myHeight * 0.06),
                          child: Center(
                            child: Text(
                              'Attention this Api is free, so you cannot send multiple requests per second, please wait and try again later.',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return Item3(
                              item: coinMarket![index],
                            );
                          },
                        ),
            ),
          ),
        ],
      ),
    );
  }

  bool isRefreshing = true;

  List? coinMarket = [];
  var coinMarketList;
  Future<List<CoinModel>?> getCoinMarket() async {
    const url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true';

    setState(() {
      isRefreshing = true;
    });
    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });
    setState(() {
      isRefreshing = false;
    });
    if (response.statusCode == 200) {
      var x = response.body;
      coinMarketList = coinModelFromJson(x);
      setState(() {
        coinMarket = coinMarketList;
      });
    } else {
      print(response.statusCode);
    }
  }
}



class searchField extends StatelessWidget {
  const searchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(color: kColor1, width: 1.0),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.search,
              color: kColor1,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: TextField(
                controller: TextEditingController(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: kColor1,
                  ),
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              width: 8,
            )
          ],
        ),
      ),
    );
  }
}
