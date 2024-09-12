import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../Provider/add_to_cart_provider.dart';
import '../../../Constants/constants.dart';
import '../../../models/product_model.dart';
import '../../Payment/adressconfirm.dart';
import '../../Payment/payment.dart';
import 'flushbar.dart';

class AddToCart extends StatefulWidget {
  final Product product;

  const AddToCart({super.key, required this.product});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int currentIndex = 1;
  Map<String, dynamic>? paymentIntentData;

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 3.h, right: 5.w, left: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              provider.toggleFavorite(widget.product);
              // if items is add then show this snackbar
              showNotificationBar(context);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kprimaryColor),
                width: 120,
                height: 50,
                child: Center(
                  child: Text(
                    "Buy Now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ConfirmAddrr()));
            },
          )
        ],
      ),
    );
  }
}
