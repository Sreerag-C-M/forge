import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:forge_final/screens/Payment/payment.dart';
import 'package:sizer/sizer.dart';
import '../../../Authentication/googleauthentication.dart';

class ConfirmAddrr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'Address',
          style: TextStyle(
              fontSize: 19.sp, fontFamily: "Astonpoliz", color: Colors.white),
        ),
      ),
      body: FetchData(),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 2.h),
        child: GestureDetector(
          child: Container(
            height: 5.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white)),
            width: 90.w,
            child: Center(
              child: Text(
                "BuyNow",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          onTap: () {
            // Check if a checkbox is selected
            if (FetchData.selectedIndex != null) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PurchaseDetailsPage()));
            } else {
              // Show error message overlapping the button
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Please select an address',
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                  backgroundColor: Colors.black,
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.only(
                    bottom: 70.0, // Adjust this value as needed
                    left: 20.0,
                    right: 20.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class FetchData extends StatefulWidget {
  static int? selectedIndex; // Make selectedIndex static

  @override
  _FetchDataState createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  List<Map<String, dynamic>> data = [];
  String? userEmail;
  bool isLoading = true;
  String errorMessage = '';
  String selectedAddress = '';

  @override
  void initState() {
    super.initState();
    _signInWithGoogle();
  }

  Future<void> _signInWithGoogle() async {
    User? user = await UserController.loginWithGoogle();
    setState(() {
      userEmail = user?.email;
    });
    if (userEmail != null) {
      _fetchData(userEmail!);
    }
  }

  Future<void> _fetchData(String email) async {
    try {
      DocumentSnapshot docSnapshot =
      await FirebaseFirestore.instance.collection('users').doc(email).get();
      if (docSnapshot.exists) {
        setState(() {
          data = List<Map<String, dynamic>>.from(docSnapshot['data']);
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'No data found for this user.';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error fetching data: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (errorMessage.isNotEmpty) {
      return Center(child: Text(errorMessage, style: TextStyle(color: Colors.red)));
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final doc = data[index];
              final name = doc['name'];
              final phone = doc['phone'];
              final address = doc['address'];

              return Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  leading: Checkbox(
                    value: FetchData.selectedIndex == index,
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          FetchData.selectedIndex = index;
                          selectedAddress = address;
                        } else {
                          FetchData.selectedIndex = null;
                          selectedAddress = '';
                        }
                      });
                    },
                  ),
                  title: Text(
                    'Name: $name',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    'Phone: $phone\nAddress: $address',
                    style: TextStyle(color: Colors.white),
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
