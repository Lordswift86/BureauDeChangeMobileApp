import 'package:Flutter/screens/homePage.dart';
import 'package:Flutter/screens/signup.dart';
import 'package:Flutter/sharedData/DataPage.dart';
import 'package:Flutter/widgets/buttons.dart';
import 'package:Flutter/widgets/validator.dart';
import 'package:Flutter/widgets/textField.dart';
import 'package:flutter/material.dart';

import '../widgets/appBarWBack.dart';

class SignInPage extends StatefulWidget {
  SignInPage(this.submitFn);

  final void Function(
    String name,
    String email,
    String phone,
    String password,
    bool isRegistered,
    BuildContext ctx,
  ) submitFn;

  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _autoValidate = false;
  static final MyValidator myValidator = MyValidator();
  UserData userdata = UserData();

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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignupPage()));
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
    );
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
      _formKey.currentState.save();
      widget.submitFn(
        userdata.name,
        userdata.email.trim(),
        userdata.phone,
        userdata.password.trim(),
        userdata.isRegistered,
        context,
      );
      print(userdata.email);
      // Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
