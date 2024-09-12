import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Constants/constants.dart';
import '../Cart/cart_screen.dart';
import '../Favorite/favorite.dart';
import '../Profile/profile.dart';
import '../home/home_screen.dart';
import '../search/search.dart';



class NavBarFlotingWidget extends StatefulWidget {
  const NavBarFlotingWidget({super.key});

  @override
  State<NavBarFlotingWidget> createState() => _NavBarFlotingWidgetState();
}

class _NavBarFlotingWidgetState extends State<NavBarFlotingWidget> {
  int currentIndex = 0;
  List screens = [
    const HomeScreen(),
    const Favorite(),
    SearchPage(),
    const CartScreen(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return await _showExitConfirmationDialog(context) ?? false;
        },
        child: WillPopScope(
          onWillPop: () async {
            if (currentIndex != 0) {
              setState(() {
                currentIndex = 0;
              });
              return false; // Prevent default back navigation
            }
            return true; // Allow default back navigation
          },
          child: Scaffold(
              backgroundColor: Colors.transparent,
              floatingActionButton: Padding(
                padding: EdgeInsets.only(left: 30),
                child: Padding(
                  padding: EdgeInsets.all(13),
                  child: Container(
                    width: double.infinity,
                    height: 65,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ClipRRect(
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.home,
                                  color: currentIndex == 0
                                      ? kprimaryColor
                                      : Colors.grey.shade400,
                                  size: 30,
                                ),
                                onPressed: () {
                                  setState(() {
                                    currentIndex = 0;
                                  });
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: currentIndex == 1
                                      ? kprimaryColor
                                      : Colors.grey.shade400,
                                  size: 30,
                                ),
                                onPressed: () {
                                  setState(() {
                                    currentIndex = 1;
                                  });
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: currentIndex == 2
                                      ? kprimaryColor
                                      : Colors.grey.shade400,
                                  size: 30,
                                ),
                                onPressed: () {
                                  setState(() {
                                    currentIndex = 2;
                                  });
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: currentIndex == 3
                                      ? kprimaryColor
                                      : Colors.grey.shade400,
                                  size: 29,
                                ),
                                onPressed: () {
                                  setState(() {
                                    currentIndex = 3;
                                  });
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.person_outline,
                                  color: currentIndex == 4
                                      ? kprimaryColor
                                      : Colors.grey.shade400,
                                  size: 30,
                                ),
                                onPressed: () {
                                  setState(() {
                                    currentIndex = 4;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // ),
              body: screens[currentIndex]),
        ));
  }
}

Future<bool?> _showExitConfirmationDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.black,
        title: Text(
          'Exit App',
          style: TextStyle(color: Colors.white),
        ),
        content: Text('Are you sure you want to exit the app?',
            style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            child: Text('Exit', style: TextStyle(color: Colors.red)),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
        ],
      );
    },
  );
}
