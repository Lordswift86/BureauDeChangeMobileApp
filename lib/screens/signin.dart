import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Flutter/sharedData/DataPage.dart';
import 'package:Flutter/widgets/buttons.dart';
import 'package:Flutter/widgets/validator.dart';
import 'package:Flutter/widgets/textField.dart';
import 'package:flutter/services.dart';
import '../widgets/appBarWBack.dart';

class SignInPage extends StatefulWidget {
  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var isLoading = false;
  bool _autoValidate = false;
  static final MyValidator myValidator = MyValidator();
  UserData userdata = UserData();
  final _auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool allowClose = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      // double press back button to close app
      child: DoubleBack(
        condition: allowClose,
        onConditionFail: () {
          setState(() {
            allowClose = true;
          });
        },
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Color.fromRGBO(25, 25, 25, 21),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: MyAppBarWBack('Sign In'),
          ),
          body: Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                  child: MyTextField(
                    myLabelText: 'Email',
                    myHintText: 'Emmiebisi@gmail.com',
                    myObscureText: false,
                    myKeyboardType: TextInputType.emailAddress,
                    myOnSaved: (value) {
                      userdata.email = value;
                    },
                    myValidators: myValidator.validateEmail,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                  child: MyTextField(
                    myLabelText: 'Password',
                    myHintText: 'Emmie',
                    myObscureText: true,
                    myKeyboardType: TextInputType.visiblePassword,
                    myOnSaved: (value) {
                      userdata.password = value;
                    },
                    myValidators: myValidator.validatePassword,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 40, 90, 0),
                  child: Buttons('Submit', _validateInputs),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 20, 90, 0),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('/signup');
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  void _validateInputs() async {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
      _formKey.currentState.save();

      //  AuthResult authResult
      User user;
      var isRegistered = true;
      print(userdata.email);
      try {
        setState(() {
          isLoading = true;
        });
        // if not previously registered snackbar pops to
        // redirect to another page
        if (isRegistered) {
          loading();
          user = (await _auth.signInWithEmailAndPassword(
                  email: userdata.email, password: userdata.password))
              .user;
          Navigator.of(context).pushReplacementNamed('/home');
        } else {
          // displays snackbar and navigates to screen on OK
          _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text('Email does not exist please Signup'),
              duration: Duration(seconds: 10),
              action: SnackBarAction(
                label: 'OK',
                onPressed: () {
                  Navigator.of(context).popAndPushNamed('/signup');
                },
              ),
              backgroundColor: Theme.of(context).errorColor));
        }
      } on PlatformException catch (err) {
        var message = 'An error occurred, please check your credentials!';
        if (err.message != null) {
          message = err.message;
        }
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(message),
            backgroundColor: Theme.of(context).errorColor));
        setState(() {
          isLoading = false;
        });
      } catch (err) {
        print(err);
      }

      // Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  void loading([String text]) {
    showDialog(
      context: _scaffoldKey.currentContext,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            semanticsLabel: 'Please Wait',
            strokeWidth: 4.0,
          ),
        );
      },
    );
  }
}
