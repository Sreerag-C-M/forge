import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forge_final/screens/Profile/widgets/accountedit.dart';
import 'package:forge_final/screens/Profile/widgets/buyagain.dart';
import 'package:forge_final/screens/Profile/widgets/orders.dart';
import 'package:sizer/sizer.dart';
import '../../Authentication/googleauthentication.dart';
import '../../Authentication/reg.dart';
import '../../Constants/constants.dart';
import '../search/history/history.dart';

class Profile extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          shape: Border(bottom: BorderSide(color: kprimaryColor)),
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Profile',
            style: TextStyle(
                color: kcontentColor,
                fontSize: 19.sp,
                fontWeight: FontWeight.bold,
                fontFamily: "Astonpoliz"),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: ((2.5).h),
            ),
            Padding(
              padding: EdgeInsets.only(left: 3.w),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                CircleAvatar(
                  radius: 5.w,
                  backgroundImage: NetworkImage(user?.photoURL ?? ''),
                ),
                SizedBox(width: 2.w),
                Row(children: [
                  Text(
                    "Welcome",
                    style: TextStyle(fontSize: 17.sp, color: kcontentColor),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    user?.displayName ?? 'Guest User',
                    style: TextStyle(
                        fontSize: 17.sp,
                        color: kcontentColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Astonpoliz"),
                  ),
                ]),
              ]),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: CustomCard(
                          cardText: "Your Orders",
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => YourOrdersScreen(
                                        orders: [],
                                      )));
                        },
                      ),
                      GestureDetector(
                        child: CustomCard(
                          cardText: "Buy Again",
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => buyAgainScreen(
                                        orders: [],
                                      )));
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          child: customCard(),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserHome(),
                              )))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.h,),
            Divider(
              indent: 3.w,
              endIndent: 3.w,
              color: Colors.white,
              height: 1,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w,top: 1.h),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recent Search',
                  style: TextStyle(
                      fontFamily: "Astonpoliz",
                      fontSize: 18.sp,
                      color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              child: Container(
                height: 16.h, // Adjust height as needed
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                child: SearchHistoryWidget(),
              ),
            ),
            Divider(
              indent: 3.w,
              endIndent: 3.w,
              color: Colors.white,
              height: 1,
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: 25.w,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
              child: TextButton(
                  onPressed: () {
                    _showExitConfirmationDialog(context);
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white70),
                  )),
            )
          ]),
        ));
  }
}

class CustomCard extends StatelessWidget {
  final String cardText;

  const CustomCard({required this.cardText});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Container(
        color: Colors.black12,
        width: 40.w,
        height: (6.5).h,
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text(
            cardText,
            style: TextStyle(fontSize: 15.sp, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class customCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Container(
        color: Colors.black12,
        width: 81.w,
        height: (6.5).h,
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text(
            "Account",
            style: TextStyle(fontSize: 15.sp, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

Future<bool?> _showExitConfirmationDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            'Logout?',
            style: TextStyle(color: Colors.white, fontFamily: "Astonpoliz"),
          ),
          content: Text('Are you sure you want to logout?',
              style: TextStyle(color: Colors.white, fontFamily: "Astonpoliz")),
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
                UserController.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Regscrn()));
              },
            ),
          ],
        );
      });
}
