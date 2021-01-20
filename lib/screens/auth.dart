import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:Flutter/screens/homePage.dart';
import 'package:Flutter/screens/signin.dart';
import 'package:Flutter/screens/signup.dart';
import 'package:Flutter/sharedData/DataPage.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final _auth = FirebaseAuth.instance;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  UserData userdata = UserData();

  void _submitAuthForm() async {
    //  AuthResult authResult;
    User user;
    try {
      // if not previously registered snackbar pops to
      // redirect to another page
      if (userdata.isRegistered) {
        user = (await _auth.signInWithEmailAndPassword(
                email: userdata.email, password: userdata.password))
            .user;
        print(userdata.email);
      } else {
        // displays snackbar and navigates to screen on OK
        Scaffold.of(userdata.ctx).showSnackBar(SnackBar(
            content: Text('Email does not exist please Signup'),
            duration: Duration(seconds: 10),
            action: SnackBarAction(
              label: 'OK',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupPage()));
              },
            ),
            backgroundColor: Theme.of(context).errorColor));
        print(userdata.isRegistered);
        // user = (await _auth.createUserWithEmailAndPassword(
        //         email: email, password: password))
        //     .user;
        // print(email);
      }
      // await FirebaseFirestore.instance.collection('user').doc(user.uid).set({
      //   'name': name,
      //   'phone': phone,
      //   'email': email,
      // });
    } catch (err) {
      var message = 'An error occurred, please check your credentials!';
      if (err.message != null) {
        message = err.message;
      }
      Scaffold.of(userdata.ctx).showSnackBar(SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor));
    } catch (err) {
      print(err);
    }
    print(userdata.email);
    // print(name);
    // print(password);
    // print(phone);
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      body: SignInPage(),
    );
  }

//   void _submitSignupForm(
//     String name,
//     String email,
//     String phone,
//     String password,
//     bool isLogin,
//     BuildContext ctx,
//   ) async {
//     AuthResult authResult;

//     try {
//       if (isRegistered) {
//         user = (await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password))
  //     .user;
  // print(email);
//       } else {
//        // displays snackbar and navigates to screen on OK
  // Scaffold.of(ctx).showSnackBar(SnackBar(
  //     content: Text('Email already used please Login'),
  //     duration: Duration(seconds: 10),
  //     action: SnackBarAction(
  //       label: 'OK',
  //       onPressed: () {
  //         Navigator.push(context,
  //             MaterialPageRoute(builder: (context) => SignInPage()));
//       }
//     } catch (err) {
//       var message = 'An error occurred, please check your credentials!';
//       if (err.message != null) {
//         message = err.message;
//       }
//       Scaffold.of(ctx).showSnackBar(SnackBar(
//           content: Text(message),
//           backgroundColor: Theme.of(context).errorColor));
//     } catch (err) {
//       print(err);
//     }
//     print(email);
//     // print(name);
//     // print(password);
//     // print(phone);
//   }
}

class help extends StatefulWidget {
  @override
  _helpState createState() => _helpState();
}

class _helpState extends State<help> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
