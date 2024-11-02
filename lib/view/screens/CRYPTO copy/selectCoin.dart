import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/colors.dart';
import 'package:gradp2p/core/constants/routes.dart';
import 'package:gradp2p/data/model/chartModel.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';

class SelectCoin extends StatefulWidget {
  final selectItem;
  final double currentPrice;
  final double marketCapChange;

  SelectCoin({
    required this.selectItem,
    required this.currentPrice,
    required this.marketCapChange,
  });

  @override
  State<SelectCoin> createState() => _SelectCoinState();
}

class _SelectCoinState extends State<SelectCoin> {
  late TrackballBehavior trackballBehavior;
  static const Map<String, Map<String, String>> cryptoNames = {
    'bitcoin': {'name': 'bitcoin', 'additionalName': 'BTC'},
    'ethereum': {'name': 'ethereum', 'additionalName': 'ETH'},
    'tether': {'name': 'tether', 'additionalName': 'USDT'},
    'binancecoin': {'name': 'binancecoin', 'additionalName': 'BNB'},
    'solana': {'name': 'solana', 'additionalName': 'SOL'},
    'staked-ether': {'name': 'staked_ether', 'additionalName': 'stETH'},
    'usd-coin': {'name': 'usd_coin', 'additionalName': 'USDC'},
    'ripple': {'name': 'ripple', 'additionalName': 'XRP'},

    // 'the-open-network': {'name': 'The Open Network', 'additionalName': 'TON'},
    // 'dogecoin': {'name': 'Dogecoin', 'additionalName': 'DOGE'},
    // Add more constants for each cryptocurrency
  };

  @override
  void initState() {
    getChart();
    trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    String name =
        cryptoNames[widget.selectItem.id]?['name'] ?? widget.selectItem.id;
    String additionalName =
        cryptoNames[widget.selectItem.id]?['additionalName'] ?? '';
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 32,
            color: Colors.black54,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        height: myHeight,
        width: myWidth,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          height: myHeight * 0.08,
                          child: Image.network(widget.selectItem.image)),
                      SizedBox(
                        width: myWidth * 0.03,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            additionalName,
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '\$' + widget.currentPrice.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                ],
              ),
              Column(
                children: [
                  Divider(),
                  SizedBox(
                    height: myHeight * 0.01,
                  ),
                  Center(
                    child: Container(
                      height: myHeight * 0.04,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: text.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: myWidth * 0.02),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  textBool = [
                                    false,
                                    false,
                                    false,
                                    false,
                                    false,
                                    false
                                  ];
                                  textBool[index] = true;
                                });
                                setDays(text[index]);
                                getChart();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: myWidth * 0.03,
                                    vertical: myHeight * 0.005),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: textBool[index] == true
                                      ? Color(0xffFBC700).withOpacity(0.3)
                                      : Colors.transparent,
                                ),
                                child: Text(
                                  text[index],
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: myHeight * 0.48,
                      width: myWidth,
                      child: isRefresh == true
                          ? Center(
                              child: CircularProgressIndicator(
                                color: kColor1,
                              ),
                            )
                          : itemChart == null
                              ? Padding(
                                  padding: EdgeInsets.all(myHeight * 0.06),
                                  child: Center(
                                    child: Text(
                                      'Attention this Api is free, so you cannot send multiple requests per second, please wait and try again later.',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                )
                              : SfCartesianChart(
                                  trackballBehavior: trackballBehavior,
                                  zoomPanBehavior: ZoomPanBehavior(
                                      enablePinching: true,
                                      zoomMode: ZoomMode.x),
                                  series: <CandleSeries>[
                                    CandleSeries<ChartModel, int>(
                                        enableSolidCandles: true,
                                        enableTooltip: true,
                                        bullColor: Colors.green,
                                        bearColor: Colors.red,
                                        dataSource: itemChart!,
                                        xValueMapper: (ChartModel sales, _) =>
                                            sales.time,
                                        lowValueMapper: (ChartModel sales, _) =>
                                            sales.low,
                                        highValueMapper:
                                            (ChartModel sales, _) => sales.high,
                                        openValueMapper:
                                            (ChartModel sales, _) => sales.open,
                                        closeValueMapper:
                                            (ChartModel sales, _) =>
                                                sales.close,
                                        animationDuration: 55)
                                  ],
                                ),
                    ),
                  ),
                  Divider(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(
                        AppRoute.Buycrypto,
                        arguments: {
                          'selectItemID': widget.selectItem.id,
                          'name': name, // Pass the name
                          'additionalName':
                              additionalName, // Pass the additional name
                          'price': widget.currentPrice,
                          'image':
                              widget.selectItem.image, // Pass the image URL
                        },
                      );
                    },
                    child: Text("Buy",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Color(0xff5063bf),
                        minimumSize: Size(140, 50)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(
                        AppRoute.Sellcrypto,
                        arguments: {
                          'selectItemID': widget.selectItem.id,
                          'name': name, // Pass the name
                          'additionalName':
                              additionalName, // Pass the additional name
                          'price': widget.currentPrice,
                          'image':
                              widget.selectItem.image, // Pass the image URL
                        },
                      );
                    },
                    child: Text("Sell",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Color(0xff5063bf),
                        minimumSize: Size(140, 50)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }

  List<String> text = ['D', 'W', 'M', '3M', '6M', 'Y'];
  List<bool> textBool = [false, false, true, false, false, false];

  int days = 30;

  setDays(String txt) {
    if (txt == 'D') {
      setState(() {
        days = 1;
      });
    } else if (txt == 'W') {
      setState(() {
        days = 7;
      });
    } else if (txt == 'M') {
      setState(() {
        days = 30;
      });
    } else if (txt == '3M') {
      setState(() {
        days = 90;
      });
    } else if (txt == '6M') {
      setState(() {
        days = 180;
      });
    } else if (txt == 'Y') {
      setState(() {
        days = 365;
      });
    }
  }

  List<ChartModel>? itemChart;

  bool isRefresh = true;

  Future<void> getChart() async {
    String url = 'https://api.coingecko.com/api/v3/coins/' +
        widget.selectItem.id +
        '/ohlc?vs_currency=usd&days=' +
        days.toString();

    setState(() {
      isRefresh = true;
    });

    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

    setState(() {
      isRefresh = false;
    });
    if (response.statusCode == 200) {
      Iterable x = json.decode(response.body);
      List<ChartModel> modelList =
          x.map((e) => ChartModel.fromJson(e)).toList();
      setState(() {
        itemChart = modelList;
      });
    } else {
      print(response.statusCode);
    }
  }
}
