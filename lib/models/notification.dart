import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class NotificationHelper {
  static void showNotification(BuildContext context, String message) {
    Flushbar(
      message: message,
      backgroundColor: Colors.black,
      duration: Duration(seconds: 2),
      // Customize other properties as needed
    ).show(context);
  }
}
