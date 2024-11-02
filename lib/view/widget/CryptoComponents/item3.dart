import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:gradp2p/view/screens/CRYPTO%20copy/selectCoin.dart';

class Item3 extends StatelessWidget {
  final item;
  Item3({this.item});

  static const Map<String, double> marketCapChangePercentage24H = {
    'bitcoin': 5.0,
    'ethereum': -3.2,
    'ripple': -2.5,
     'solana': -19.6,
    'staked-ether': -1934.09,
    
    // Add more constants for each cryptocurrency
  };

  static const Map<String, double> currentPrice = {
    'bitcoin': 30520.40,
    'ethereum': 1931.91,
    'ripple': 0.49,
    'tether': 1.00,
    'binancecoin': 237.80,
    'solana': 19.67,
    'staked-ether': 1934.09,
    'usd-coin': 1.00,
    'the-open-network': 1.2,
    'dogecoin': 0.49,
    // Add more constants for each cryptocurrency
  };

  static const Map<String, Map<String, String>> cryptoNames = {
    'bitcoin': {'name': 'bitcoin', 'additionalName': 'BTC'},
    'ethereum': {'name': 'ethereum', 'additionalName': 'ETH'},
    'ripple': {'name': 'ripple', 'additionalName': 'XRP'},
    'tether': {'name': 'tether', 'additionalName': 'USDT'},
    'binancecoin': {'name': 'binancecoin', 'additionalName': 'BNB'},
    'solana': {'name': 'solana', 'additionalName': 'SOL'},
    'staked-ether': {'name': 'staked_ether', 'additionalName': 'stETH'},
    'usd-coin': {'name': 'usd_coin', 'additionalName': 'USDC'},
    // 'the-open-network': {'name': 'The Open Network', 'additionalName': 'TON'},
    // 'dogecoin': {'name': 'Dogecoin', 'additionalName': 'DOGE'},
    // Add more constants for each cryptocurrency
  };

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    double marketCapChange = marketCapChangePercentage24H[item.id] ?? 0.0;
    double price = currentPrice[item.id] ?? 0.0;
    String name = cryptoNames[item.id]?['name'] ?? item.id;
    String additionalName = cryptoNames[item.id]?['additionalName'] ?? '';

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: myWidth * 0.02, vertical: myHeight * 0.025),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectCoin(
                selectItem: item,
                currentPrice: price,
                marketCapChange: marketCapChange,
              ),
            ),
          );
        },
        child: Container(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                    height: myHeight * 0.05, child: Image.network(item.image)),
              ),
              SizedBox(
                width: myWidth * 0.02,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      additionalName,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: myWidth * 0.01,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: myHeight * 0.05,
                  width: myWidth * 0.2,
                  child: Sparkline(
                    data: item.sparklineIn7D.price,
                    lineWidth: 2.0,
                    lineColor: marketCapChange >= 0 ? Colors.green : Colors.red,
                    fillMode: FillMode.below,
                    fillGradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.0, 0.7],
                        colors: marketCapChange >= 0
                            ? [Colors.green, Colors.green.shade100]
                            : [Colors.red, Colors.red.shade100]),
                  ),
                ),
              ),
              SizedBox(
                width: myWidth * 0.02,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$ ' + price.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
