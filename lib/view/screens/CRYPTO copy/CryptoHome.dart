import 'package:flutter/material.dart';

import 'package:gradp2p/data/model/coinModel.dart';
import 'package:gradp2p/view/screens/CRYPTO%20copy/CryptoMarket.dart';
import 'package:gradp2p/view/widget/CryptoComponents/item3.dart';

import 'package:http/http.dart' as http;

class CryptoHome extends StatefulWidget {
  CryptoHome({super.key});

  @override
  State<CryptoHome> createState() => _CryptoHomeState();
}

class _CryptoHomeState extends State<CryptoHome> {
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
        // title: Text('Money Transfer'),
        // centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Welcome',
              style: TextStyle(
                color: Color(0xFF878787),
                fontSize: 18,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.05,
              ),
            ),
            const Text(
              'Mohamed hany',
              style: TextStyle(
                color: Color(0xFF5163BF),
                fontSize: 28,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w500,
                letterSpacing: 0.08,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Charts',
                  style: TextStyle(
                    color: Color(0xFF878787),
                    fontSize: 18,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                    height: 0.07,
                    letterSpacing: 0.05,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => CryptoMarket(),
                      ),
                    );
                  },
                  child: const Text(
                    'See All  >',
                    style: TextStyle(
                      color: Color(0xFF5163BF),
                      fontSize: 16,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.05,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: myWidth * 0.03),
                child: isRefreshing == true
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Color(0xffFBC700),
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
                            // shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
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
      ),
    );
  }

  bool isRefreshing = true;

  List? coinMarket = [];
  var coinMarketList;

  Future<List<CoinModel>?> getCoinMarket() async {
    const url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true';

    if (mounted) {
      setState(() {
        isRefreshing = true;
      });
    }

    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

    if (mounted) {
      setState(() {
        isRefreshing = false;
      });
    }

    if (response.statusCode == 200) {
      var x = response.body;
      coinMarketList = coinModelFromJson(x);

      if (mounted) {
        setState(() {
          coinMarket = coinMarketList;
        });
      }
    } else {
      print(response.statusCode);
    }
  }
}
