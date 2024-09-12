import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../Provider/favorite_provider.dart';
import '../../Constants/constants.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finalList = provider.favorites;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: kprimaryColor)),
        backgroundColor: Colors.black,
        title: Text(
          "Favorite",
          style: TextStyle(
            fontSize: 19.sp,
              // fontWeight: FontWeight.bold,
              color: kcontentColor,
              fontFamily: "Astonpoliz"),
        ),
        centerTitle: true,
      ),
      body: finalList!.isEmpty
          ? Padding(
              padding: const EdgeInsets.only(bottom: 150),
              child: Center(
                  child: Text(
                "No items here.",
                style: TextStyle(color: kcontentColor),
              )),
            )
          : Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: finalList.length,
                        itemBuilder: (context, index) {
                          final favoriteItems = finalList[index];
                          return Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        width: 85,
                                        height: 85,
                                        decoration: BoxDecoration(
                                          color: kcontentColor,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Image.asset(favoriteItems.image),
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            favoriteItems.title,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            favoriteItems.category,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade400,
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            "\₹${favoriteItems.price}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              // for delete button
                              Positioned(
                                top: 50,
                                right: 35,
                                child: GestureDetector(
                                  onTap: () {
                                    finalList.removeAt(index);
                                    setState(() {});
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }))
              ],
            ),
    );
  }
}
