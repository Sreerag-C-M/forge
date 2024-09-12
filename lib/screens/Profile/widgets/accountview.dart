import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sizer/sizer.dart';
import '../../../Authentication/googleauthentication.dart';
import '../../../Constants/constants.dart';
import 'adddata.dart';

class Profileedit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: kprimaryColor)),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_outlined)),
        centerTitle: true,
        title: Text(
          "Address",
          style: TextStyle(fontFamily: "Astonpoliz"),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddData()));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: FetchData(),
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

  void _editItem(BuildContext context, Map<String, dynamic> doc) {
    final nameController = TextEditingController(text: doc['name']);
    final phoneController = TextEditingController(text: doc['phone']);
    final addressController = TextEditingController(text: doc['address']);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white.withOpacity(.9),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: const BorderSide(color: kprimaryColor, width: 3.0)),
          title: Text('Edit Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
              ),
              TextField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                try {
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(userEmail)
                      .update({
                    'data': FieldValue.arrayRemove([doc])
                  });
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(userEmail)
                      .update({
                    'data': FieldValue.arrayUnion([
                      {
                        'name': nameController.text,
                        'phone': phoneController.text,
                        'address': addressController.text,
                      }
                    ])
                  });
                  setState(() {
                    doc['name'] = nameController.text;
                    doc['phone'] = phoneController.text;
                    doc['address'] = addressController.text;
                  });
                  Navigator.of(context).pop();
                } catch (e) {
                  print('Error updating document: $e');
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteItem(Map<String, dynamic> doc) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userEmail)
          .update({
        'data': FieldValue.arrayRemove([doc])
      });
      setState(() {
        data.remove(doc);
      });
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddData()));
            },
            child: Text("Add Data")),
      );
    }

    if (errorMessage.isNotEmpty) {
      return Center(
          child: Text(errorMessage, style: TextStyle(color: Colors.red)));
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
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.white),
                        onPressed: () {
                          _editItem(context, doc);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.white),
                        onPressed: () {
                          _deleteItem(doc);
                        },
                      ),
                    ],
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
