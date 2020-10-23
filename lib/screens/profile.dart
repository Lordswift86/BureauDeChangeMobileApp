import 'dart:io';
import 'package:Flutter/screens/ccDetail.dart';
import 'package:Flutter/widgets/drawer/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../sharedData/DataPage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserData userData = UserData();
  final _picker = ImageSelect();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        drawer: MyDrawer(),
        backgroundColor: Color.fromRGBO(25, 25, 25, 21),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: MyAppBar('Profile'),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.grey[800],
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Container(
                child: CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.pink,
                  child: CircleAvatar(
                    radius: 85,
                    backgroundImage: AssetImage('lib/assets/emmie.jpeg'),
                    child: FlatButton.icon(
                        onPressed: getImage,
                        icon: Icon(Icons.camera_alt),
                        label: Text('Change picture')),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('userData.name', style: TextStyle(fontSize: 16)),
              SizedBox(
                height: 3,
              ),
              Text('Ikeja Lagos', style: TextStyle(fontSize: 12)),
              Divider(
                height: 1,
              ),
              Container(
                color: Colors.grey[900],
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Manage account',
                      style: TextStyle(fontSize: 16),
                    ),
                    IconButton(
                        icon: Icon(Icons.arrow_forward_ios), onPressed: null)
                  ],
                ),
              ),
              Divider(
                height: 2,
              ),
              Container(
                color: Colors.grey[900],
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Payments',
                      style: TextStyle(fontSize: 16),
                    ),
                    IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CcDetails()),
                          );
                        })
                  ],
                ),
              ),
              Divider(
                height: 2,
              ),
              Container(
                color: Colors.grey[900],
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Settings',
                      style: TextStyle(fontSize: 16),
                    ),
                    IconButton(
                        icon: Icon(Icons.arrow_forward_ios), onPressed: null)
                  ],
                ),
              ),
              Divider(
                height: 2,
              ),
              Container(
                color: Colors.grey[900],
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Refer a friend',
                      style: TextStyle(fontSize: 16),
                    ),
                    IconButton(
                        icon: Icon(Icons.arrow_forward_ios), onPressed: null)
                  ],
                ),
              ),
              Divider(
                height: 2,
              ),
              Container(
                color: Colors.grey[900],
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'FAQ',
                      style: TextStyle(fontSize: 16),
                    ),
                    IconButton(
                        icon: Icon(Icons.arrow_forward_ios), onPressed: null)
                  ],
                ),
              ),
              Divider(
                height: 2,
              ),
              Container(
                color: Colors.grey[900],
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Logout',
                      style: TextStyle(fontSize: 16),
                    ),
                    IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                        })
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  File _image;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
