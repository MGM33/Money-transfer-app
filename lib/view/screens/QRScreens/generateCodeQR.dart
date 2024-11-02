import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRScreen extends StatelessWidget {
  final List<String> qrData;

  const GenerateQRScreen({Key? key, required this.qrData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dataString = qrData.join('|'); // Combine list into a single string
    return Scaffold(
      appBar: AppBar(title: Text('Generate QR Code')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: dataString,
              version: QrVersions.auto,
              size: 200.0,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(
                    AppRoute.Recievescreen); // Navigate back to previous screen
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
