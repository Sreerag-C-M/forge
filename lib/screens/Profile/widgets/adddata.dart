import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sizer/sizer.dart';
import '../../../Authentication/googleauthentication.dart';
import '../../../Constants/constants.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String? userEmail;

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
  }

  Future<void> _addData() async {
    String name = _nameController.text;
    String phone = _phoneController.text;
    String address = _addressController.text;

    if (name.isNotEmpty && phone.isNotEmpty && address.isNotEmpty && userEmail != null) {
      if (phone.length == 10 && int.tryParse(phone) != null) {
        await FirebaseFirestore.instance.collection('users').doc(userEmail).set({
          'data': FieldValue.arrayUnion([{
            'name': name,
            'phone': phone,
            'address': address
          }])
        }, SetOptions(merge: true));
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter a valid 10-digit phone number')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: kprimaryColor)),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        title: Text('Add New Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white)),
              child: Padding(
                padding: EdgeInsets.only(left: 3.w),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _nameController,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: 'Name',
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white)),
                child: Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: _phoneController,
                      decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none),
                    ))),
            SizedBox(height: 2.h,),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white)),
                child: Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: _addressController,
                      decoration: InputDecoration(
                          labelText: 'Address',
                          labelStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none
                      ),
                    ))),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addData,
              child: Text('Add Data'),
            ),
          ],
        ),
      ),
    );
  }
}
