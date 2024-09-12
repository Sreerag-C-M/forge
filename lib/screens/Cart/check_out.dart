import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../Provider/add_to_cart_provider.dart';
import '../../Constants/constants.dart';
import '../Payment/adressconfirm.dart';

class CheckOutBox extends StatelessWidget {
  const CheckOutBox({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    "Total",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19.sp,
                    ),
                  ),
                  Text(
                    "\₹${provider.totalPrice()}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 51.w),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kprimaryColor,
                      minimumSize: Size(2.w, 6.h),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConfirmAddrr()));
                    },
                    child: const Text(
                      "Place Order",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
// now we add the provider and display the total price
