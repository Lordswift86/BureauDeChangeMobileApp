import 'package:Flutter/screens/auth.dart';
import 'package:Flutter/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Flutter/screens/signup.dart';
import 'screens/landingPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      // child: StreamProvider<User>.value(
      //   value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Service App',

        theme: ThemeData(
            backgroundColor: Color.fromRGBO(25, 25, 25, 21),
            fontFamily: '',
            brightness: Brightness.dark,
            primaryColor: Colors.red[400],
            accentColor: Colors.blueAccent,
            buttonTheme: ButtonTheme.of(context).copyWith(
                buttonColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            textTheme: TextTheme(
              headline6: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w300),
              subtitle1: TextStyle(color: Colors.white, fontSize: 14),
            ),
            appBarTheme: AppBarTheme(color: Colors.white)),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.onAuthStateChanged,
            builder: (context, userSnapshot) {
              if (userSnapshot.hasData) {
                return Home();
              }
              return Auth();
            }),
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => LandingPage(),
        //   '/signUp': (context) => SignupPage(),
      ),
    );
  }
}
