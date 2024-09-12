import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sizer/sizer.dart';
import '../../../Authentication/googleauthentication.dart';
import '../../../Constants/constants.dart';
import 'accountview.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  User? _user;

  @override
  void initState() {
    super.initState();
    _signInWithGoogle();
  }

  Future<void> _signInWithGoogle() async {
    User? user = await UserController.loginWithGoogle();
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: kprimaryColor)),
        automaticallyImplyLeading: false,
        leading:
            IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_outlined)),
        centerTitle: true,
        title: Text(
          "Account",
          style: TextStyle(fontFamily: "Astonpoliz"),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: _user == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 33.w),
                      child: CircleAvatar(
                        radius: 28.sp,
                        backgroundImage: NetworkImage(_user!.photoURL ?? ''),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      width: 90.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.white)),
                      child: Center(
                        child: Text(
                          'Name:  ${_user!.displayName}',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Container(
                      width: 90.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.white)),
                      child: Center(
                        child: Text(
                          'Phone:  ${_user!.phoneNumber ?? 'Not provided'}',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Container(
                      width: 90.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.white)),
                      child: Center(
                        child: Text(
                          'Email:  ${_user!.email}',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25.w),
                      child: GestureDetector(
                        child: Container(
                          width: 40.w,
                          height: 6.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white)),
                          child: Center(
                            child: Text(
                              'Your Addresses',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profileedit()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
