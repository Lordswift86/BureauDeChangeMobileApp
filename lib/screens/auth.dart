import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:Flutter/screens/homePage.dart';
import 'package:Flutter/screens/signin.dart';
import 'package:Flutter/screens/signup.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final _auth = FirebaseAuth.instance;

  void _submitAuthForm(
    String name,
    String email,
    String phone,
    String password,
    bool isRegistered,
    BuildContext ctx,
  ) async {
    //  AuthResult authResult;
    User user;
    try {
      // if not previously registered snackbar pops to
      // redirect to another page
      if (isRegistered) {
        user = (await _auth.signInWithEmailAndPassword(
                email: email, password: password))
            .user;
        print(email);
      } else {
        // displays snackbar and navigates to screen on OK
        Scaffold.of(ctx).showSnackBar(SnackBar(
            content: Text('Email does not exist please Signup'),
            duration: Duration(seconds: 10),
            action: SnackBarAction(
              label: 'OK',
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
            backgroundColor: Theme.of(context).errorColor));

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
      Scaffold.of(ctx).showSnackBar(SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor));
    } catch (err) {
      print(err);
    }
    print(email);
    // print(name);
    // print(password);
    // print(phone);
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      body: SignInPage(_submitAuthForm),
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
