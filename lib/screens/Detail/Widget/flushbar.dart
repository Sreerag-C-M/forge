import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Cart/cart_screen.dart';

void showNotificationBar(BuildContext context) {
  Flushbar(
    message: 'Successfully added to cart!',
    backgroundColor: Colors.black,
    duration: Duration(seconds: 2),
    mainButton: TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartScreen()),
        );
      },
      child: Container(
        width: 60,
        height: 33,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: Text(
            'View',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
    ),
  ).show(context);
}
