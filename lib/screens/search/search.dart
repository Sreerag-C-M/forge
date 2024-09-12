import 'package:flutter/material.dart';
import 'package:forge_final/Constants/constants.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../Provider/add_to_cart_provider.dart';
import '../../models/product_model.dart';
import '../Detail/detail_screen.dart';
import 'history/history.dart';

class SearchPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    // Initialize _allProducts with your product data
    Provider.of<CartProvider>(context, listen: false).all = [
      Product(
        title: "JBL Headphones",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
        image: "assets/electronics/jbl.png",
        price: 80,
        seller: "JBL",
        category: "Electronics",
        review: "(320 Reviews)",
        rate: 4.8,
        quantity: 1,
      ),
      Product(
        title: "Iphone 12",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
        image: "assets/phones/12.png",
        price: 799,
        seller: "Apple",
        category: "Phone",
        review: "(32 Reviews)",
        rate: 4.7,
        quantity: 1,
      ),
      Product(
        title: "Shirt",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
        image: "assets/men/menshirt.png",
        price: 500,
        seller: "Bare",
        category: "MenFashion",
        review: "(90 Reviews)",
        rate: 5.0,
        quantity: 1,
      ),
      Product(
        title: "Women Kurta",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
        image: "assets/women/kurta.png",
        price: 299,
        seller: "Sila",
        category: "WomenFashion",
        review: "(25 Reviews)",
        rate: 5.0,
        quantity: 1,
      ),
      Product(
        title: "Men Pants",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
        image: "assets/men/pants.png",
        price: 400,
        seller: "Denim",
        category: "Fashion",
        review: "(500 Reviews)",
        rate: 4.5,
        quantity: 1,
      ),
      Product(
        title: "Airdopes 148",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
        image: "assets/electronics/airdopes148.png",
        price: 300,
        seller: "Boat",
        category: "Electronics",
        review: "(200 Reviews)",
        rate: 5.0,
        quantity: 1,
      ),
      Product(
        title: "Frock",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
        image: "assets/women/lehenga.png",
        price: 666,
        seller: "Store",
        category: "WomenFashion",
        review: "(100 Reviews)",
        rate: 4.0,
        quantity: 1,
      ),
      Product(
        title: "Samsung S22 Ultra",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
        image: "assets/phones/s22.png",
        price: 799,
        seller: "Samsung",
        category: "Mobiles",
        review: "(200 Reviews)",
        rate: 5.0,
        quantity: 1,
      ),
      Product(
        title: "Men Formal",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
        image: "assets/men/formal.png",
        price: 300,
        seller: "Store",
        category: "menFashion",
        review: "(200 Reviews)",
        rate: 3.0,
        quantity: 1,
      ),
      Product(
        title: "T-Shirt",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
        image: "assets/women/t-shert.png",
        price: 155,
        seller: "Love Store",
        category: "Electronics",
        review: "(20 Reviews)",
        rate: 5.0,
        quantity: 1,
      ),
      Product(
        title: "OnePlus Bud 2",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
        image: "assets/electronics/oneplus.png",
        price: 500,
        seller: "One Plus",
        category: "Shoes",
        review: "(100 Reviews)",
        rate: 4.8,
        quantity: 1,
      ),
      Product(
        title: "Xiaomi 13 Ultra",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
        image: "assets/phones/13Ultra.png",
        price: 599,
        seller: "Xiaomi",
        category: "Mobiles",
        review: "(100 Reviews)",
        rate: 4.9,
        quantity: 1,
      ),
      Product(
        title: "Women Pants",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
        image: "assets/women/pants.png",
        price: 155,
        seller: "PK Store",
        category: "WomenFashion",
        review: "(55 Reviews)",
        rate: 5.0,
        quantity: 1,
      ),
      Product(
        title: "T-Shirt",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
        image: "assets/men/t-shirt.png",
        price: 200,
        seller: "Hot Store",
        category: "MenFashion",
        review: "(1k Reviews)",
        rate: 5.0,
        quantity: 1,
      ),
      Product(
        title: "Cmf Phone 1",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
        image: "assets/phones/cmf.png",
        price: 50,
        seller: "Nothing",
        category: "Mobiles",
        review: "(200 Reviews)",
        rate: 4.5,
        quantity: 1,
      ),
      Product(
        title: "Realme Bud 2 Pro",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
        image: "assets/electronics/realmebud.png",
        price: 500,
        seller: "Realme",
        category: "Shoes",
        review: "(100 Reviews)",
        rate: 4.8,
        quantity: 1,
      ),
    ];
    Provider.of<CartProvider>(context, listen: false).found =
        Provider.of<CartProvider>(context, listen: false).all;
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: kprimaryColor)),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Search',
          style: TextStyle(
              color: kcontentColor, fontFamily: "Astonpoliz", fontSize: 19.sp),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 5.h,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white70),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.only(top: (0.2).h),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (query) => cartProvider.searchProducts(query),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search products...',
                    hintStyle: TextStyle(color: Colors.white70),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.foundProducts.length,
              itemBuilder: (context, index) {
                final product = cartProvider.foundProducts[index];
                return GestureDetector(
                  onTap: () {
                    cartProvider.addToSearchHistory(product);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(product: product),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Card(
                      elevation: 2,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 2.w),
                            child: Container(
                                height: 10.h,
                                width: 15.w,
                                child: Image.asset(product.image)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Text(
                                  product.title,
                                  style: TextStyle(
                                      fontSize: 15.sp, fontFamily: "Astonpoliz"),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}