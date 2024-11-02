import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/view/screens/QRScreens/ConfirmTransactionScreen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQRScreen extends StatelessWidget {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: (controller) {
                controller.scannedDataStream.listen((scanData) {
                  // Ensure scanData and scanData.code are not null
                  if (scanData != null && scanData.code != null) {
                    // Navigate to ConfirmTransactionScreen with scanned QR data
                    Get.to(ConfirmTransactionScreen(qrData: scanData.code!));
                  } else {
                    print('Invalid QR code data');
                  }
                });
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text('Align QR Code within the frame'),
            ),
          ),
        ],
      ),
    );
  }
}
