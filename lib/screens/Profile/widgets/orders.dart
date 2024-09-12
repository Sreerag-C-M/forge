import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../Constants/constants.dart';
import '../../../models/orders.dart';

class YourOrdersScreen extends StatelessWidget {
  final List<OrderModel> orders;

  YourOrdersScreen({required this.orders});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        shape: Border(bottom: BorderSide(color: kprimaryColor)),
        centerTitle: true,
        title: Text(
          'Your Orders',
          style: TextStyle(fontSize: 19.sp, fontFamily: "Astonpoliz"),
        ),
      ),
      body: orders.isEmpty
          ? Center(
              child: Text(
                'Nothing here yet!',
                style: TextStyle(color: kcontentColor),
              ),
            )
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return ListTile(
                  title: Text(order.productName),
                  subtitle: Text('Quantity: ${order.quantity}'),
                  trailing: Text('\$${order.price.toStringAsFixed(2)}'),
                );
              },
            ),
    );
  }
}
