import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertExitApp() {
  return Get.defaultDialog(
      title: "Alert",
      middleText: "are you sure to exit ",
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: Text("confirm")),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text("cancel"))
      ]);
}
