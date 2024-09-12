import 'package:flutter/material.dart';
import 'package:forge_final/Constants/constants.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../Provider/add_to_cart_provider.dart';
import '../../Detail/detail_screen.dart';

class SearchHistoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final reversedHistory = cartProvider.searchHistory.reversed.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (reversedHistory.isEmpty)
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Center(
              child: Text(
                'No recent searches',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          )
        else
          Container(
            height: 150, // Adjust the height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: reversedHistory.length,
              itemBuilder: (context, index) {
                final product = reversedHistory[index];
                return GestureDetector(
                  onTap: () {
                    cartProvider.searchProducts(product.title);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(product: product),
                      ),
                    );
                  },
                  child: Container(
                    width: 32.w,
                    height: 32.w,
                    margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.8),
                      border: Border.all(color: kprimaryColor,width: 2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        if (product.image != null)
                          Image.asset(product.image, width: 50.w, height: 8.h)
                        else
                          Container(
                            width: 60.w,
                            height: 8.h,
                            child: Icon(Icons.image, color: Colors.white),
                          ),
                        SizedBox(height: 8),
                        Text(
                          product.title ?? 'No Title',
                          style: TextStyle(fontSize: 14.sp, color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
