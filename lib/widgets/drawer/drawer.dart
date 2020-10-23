import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Flutter/screens/buyPage.dart';
import 'package:Flutter/screens/currencyConverter.dart';
import 'package:Flutter/screens/homePage.dart';
import 'package:Flutter/screens/profile.dart';
import 'package:Flutter/screens/sellPage.dart';
import 'package:Flutter/widgets/listTile.dart';
import 'package:Flutter/sharedData/DataPage.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  UserData userdata = UserData();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20,
      child: ListView(children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.grey[900],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 85,
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.lightBlueAccent,
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage('lib/assets/timi.jpeg'),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    color: Colors.grey[500],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                  ),
                ],
              ),
              Text(
                // userdata.name.toUpperCase(),
                '',
                style: TextStyle(fontSize: 18, color: Colors.grey[500]),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.grey[500],
          child: ListTile(
              title: Text(
                'Buy Currency',
                style: TextStyle(color: Colors.grey[900]),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => BuyPage()),
                );
              }),
        ),
        Divider(
          height: 1,
        ),
        Container(
          color: Colors.grey[500],
          child: ListTile(
              title: Text('Sell Currency',
                  style: TextStyle(color: Colors.grey[900])),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SellPage()),
                );
              }),
        ),
        Divider(
          height: 1,
        ),
        Container(
          color: Colors.grey[500],
          child: ListTile(
              title: Text('Inbox', style: TextStyle(color: Colors.grey[900])),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BuyPage()),
                );
              }),
        ),
        Divider(
          height: 1,
        ),
        Container(
          color: Colors.grey[500],
          child: ListTile(
              title: Text('Currency Converter',
                  style: TextStyle(color: Colors.grey[900])),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CurrencyConverter()),
                );
              }),
        ),
        Divider(
          height: 1,
        ),
        Container(
          color: Colors.grey[500],
          child: ListTile(
              title: Text('Exchange Rates',
                  style: TextStyle(color: Colors.grey[900])),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              }),
        ),
        Divider(
          height: 1,
        ),
        Container(
          color: Colors.grey[500],
          child: ListTile(
              title: Text('Help', style: TextStyle(color: Colors.grey[900])),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BuyPage()),
                );
              }),
        ),
        Container(
          color: Colors.grey[500],
          child: ListTile(
              title: Text('Logout', style: TextStyle(color: Colors.red[900])),
              trailing: Icon(
                Icons.power_settings_new,
                color: Colors.red[900],
              ),
              onTap: () {
                FirebaseAuth.instance.signOut();
              }),
        ),
      ]),
    );
  }
}
