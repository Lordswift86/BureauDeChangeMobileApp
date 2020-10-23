import 'package:Flutter/screens/auth.dart';
import 'package:Flutter/screens/signin.dart';
import 'package:Flutter/screens/signup.dart';
import 'package:Flutter/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/buttons.dart';
import '../widgets/appbar.dart';

class LandingPage extends StatelessWidget {
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
        backgroundColor: Color.fromRGBO(25, 25, 25, 21),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: MyAppBar('App'),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  image: AssetImage('lib/assets/34.jpg'),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                child: Text(
                  'Click  Xchange',
                  style: TextStyle(
                      fontSize: 48,
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Center(
                  child: Buttons('Login', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Auth()),
                    );
                  }),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
                child: Center(
                  child: Buttons('Sign up', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
