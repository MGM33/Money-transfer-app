import 'package:flutter/material.dart';

class Cryptotransactioncontainer extends StatelessWidget {
  const Cryptotransactioncontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 340,
        height: 80,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFF5163BF)),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.arrow_upward),
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Buy Btc',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Aclonica',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.05,
                  ),
                ),
                Text(
                  '24 july 20022',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Aclonica',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.05,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  ' \$396.84',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Aclonica',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.05,
                  ),
                ),
                Text(
                  'Completed',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Aclonica',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.05,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
