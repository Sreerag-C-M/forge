import 'package:flutter/material.dart';
import '../../../Constants/constants.dart';
import '../../../Provider/favorite_provider.dart';
import '../../../models/product_model.dart';

class DetailAppBar extends StatelessWidget {
  final Product product;

  const DetailAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kcontentColor,
            ),
          ),
          const Spacer(),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
