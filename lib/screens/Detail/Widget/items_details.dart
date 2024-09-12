import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../Constants/constants.dart';
import '../../../Provider/favorite_provider.dart';
import '../../../models/product_model.dart';

class ItemsDetails extends StatelessWidget {
  final Product product;

  const ItemsDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Stack(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                product.title,
                style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                    color: Colors.white,
                    fontFamily: "Astonpoliz"),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\₹${product.price}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 25,
                        color: Colors.white,
                        fontFamily: "Astonpoliz"),
                  ),
                  const SizedBox(height: 10),
                  // for rating
                  Row(
                    children: [
                      Container(
                        width: 55,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kprimaryColor,
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              product.rate.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        product.review,
                        style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            fontFamily: "Astonpoliz"),
                      )
                    ],
                  )
                ],
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: "Seller: ",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      TextSpan(
                        text: product.seller,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      Positioned(
        right: 1.w,
        child: IconButton(
          onPressed: () {
            provider.toggleFavorite(product);
          },
          icon: Icon(
            provider.isExist(product) ? Icons.favorite : Icons.favorite_border,
            color: Colors.white,
            size: 21.sp,
          ),
        ),
      ),
    ]);
  }
}
