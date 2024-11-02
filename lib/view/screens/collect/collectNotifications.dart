import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/nitification/getNotification_controller.dart';
import 'package:intl/intl.dart';

import 'package:gradp2p/view/screens/collect/collectSummary.dart'; // Import the new screen

class CollectNoti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GetnotificationControllerImp notificationController =
        Get.put(GetnotificationControllerImp());

    // Fetch notifications when the screen is loaded
    notificationController.GetNoti();
    // Reset notification count when the page is viewed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notificationController.resetNotificationCount();
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 32,
            color: Colors.black54,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Obx(() {
        if (notificationController.notifications.isEmpty) {
          return Center(child: Text("No Notifications ")
              //CircularProgressIndicator(),
              );
        } else {
          return ListView.builder(
            itemCount: notificationController.notifications.length,
            itemBuilder: (context, index) {
              final notification = notificationController.notifications[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.notifications,
                      color: Colors.blueAccent,
                      size: 40,
                    ),
                    title: Text(
                      notification['transaction']['from'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("To: ${notification['transaction']['to']}"),
                        Text(
                            "Amount: ${notification['transaction']['amount']}"),
                        Text("State: ${notification['state']}"),
                        Text(
                            "Date: ${DateFormat.yMMMd().format(DateTime.parse(notification['createdAt']))}"),
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigate to the receipt screen with the notification data
                      Get.to(() => Collectsummary(notification: notification));
                    },
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
