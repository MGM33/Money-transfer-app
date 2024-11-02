import 'package:flutter/material.dart';

class transactionContainer extends StatelessWidget {
  const transactionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
      //  width: 340,
        //  height: 80,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF5163BF)),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'To',
              style: TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 10,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.03,
              ),
            ),
            Text(
              'John Morrison',
              style: TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 12,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                letterSpacing: 0.04,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Today',
                    style: TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 10,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.03,
                    ),
                  ),
                ),
                Text(
                  '4:34 PM',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 10,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/arrow-top.jpg'),
                ),
                 
                
                 
                
                Text(
                  '- \$396.84',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF5164BF),
                    fontSize: 16,
                    fontFamily: 'Aclonica',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.05,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
