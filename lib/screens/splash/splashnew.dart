import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../Authentication/reg.dart';
import '../navigationbar/nav_bar_screen.dart';

class Splashscrn extends StatefulWidget {
  const Splashscrn({super.key});

  @override
  State<Splashscrn> createState() => _SplashscrnState();
}

class _SplashscrnState extends State<Splashscrn> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    await Future.delayed(
        const Duration(seconds: 5)); // Simulate a delay for the splash screen
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => NavBarFlotingWidget()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Regscrn()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/login/background.png"),
                fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.black.withOpacity(.5),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: Center(
                  child: Image(
                    image: AssetImage("assets/login/logo.png"),
                    width: 20.w,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "FORGE",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Astonpoliz",
                      fontSize: 20.sp),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
