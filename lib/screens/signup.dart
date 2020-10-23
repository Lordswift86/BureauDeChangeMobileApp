import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Flutter/screens/auth.dart';
import 'package:Flutter/screens/homePage.dart';
import 'package:Flutter/screens/signin.dart';
import 'package:Flutter/widgets/buttons.dart';
import 'package:Flutter/widgets/textField.dart';
import 'package:intl_phone_field/phone_number.dart';
import '../sharedData/DataPage.dart';
import '../widgets/appBarWBack.dart';
import '../widgets/validator.dart';
import 'package:Flutter/dialogs.dart/success.dart';

class SignupPage extends StatefulWidget {
  // SignupPage(this.submitFn);

  // final void Function(
  //   String name,
  //   String email,
  //   String phone,
  //   String password,
  //   bool isRegistered,
  //   BuildContext ctx,
  // ) submitFn;
  //  SignupPage({Key key}) : super(key: key);
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _autoValidate = false;
  static final MyValidator myValidator = MyValidator();
  SaveDialog saveDialog = SaveDialog();
  UserData userdata = UserData();
  final _auth = FirebaseAuth.instance;
  User user;
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
          child: MyAppBarWBack('Sign up'),
        ),
        body: Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: MyTextField(
                      myLabelText: 'FullName',
                      myHintText: 'Emmie bisi',
                      myObscureText: false,
                      myKeyboardType: TextInputType.name,
                      myOnSaved: (value) {
                        userdata.name = value;
                      },
                      myValidators: myValidator.validateName,
                      // myAutoValidate: _validateInputs,
                    )),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: MyTextField(
                    myLabelText: 'Email',
                    myHintText: 'Emmiebisi@gmail.com',
                    myObscureText: false,
                    myKeyboardType: TextInputType.emailAddress,
                    myOnSaved: (String value) {
                      userdata.email = value;
                    },
                    myValidators: myValidator.validateEmail,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: IntlPhoneField(
                    validator: myValidator.validateMobile,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'NG',
                    onChanged: (phone) {
                      userdata.phone = phone.completeNumber;
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: MyTextField(
                    myLabelText: 'Password',
                    myHintText: 'Emmie',
                    myObscureText: true,
                    myKeyboardType: TextInputType.visiblePassword,
                    myOnSaved: (value) {
                      userdata.password = value;
                    },
                    myValidators: myValidator.validatePassword,
                    // myAutoValidate: _validateInputs,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 90),
                  child: Buttons(
                    'Submit',
                    _validateInputs,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 20, 90, 0),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Auth()));
                    },
                    child: Text(
                      'Already a member',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
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

      userdata.name.trim();
      userdata.email.trim();
      userdata.phone.trim();
      userdata.password.trim();
      try {
        // if not previously registered snackbar pops to
        // redirect to another page
        if (userdata.isRegistered) {
          user = (await _auth.createUserWithEmailAndPassword(
                  email: userdata.email, password: userdata.password))
              .user;
          await FirebaseFirestore.instance
              .collection('user')
              .doc(user.uid)
              .set({
            'name': userdata.name,
            'phone': userdata.phone,
            'email': userdata.email,
          });
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        } else {
          // Remember to put a snack bar here
          // displays snackbar and navigates to screen on OK

          // Scaffold.of(ctx).showSnackBar(SnackBar(
          // backgroundColor: Theme.of(context).errorColor));
          //     content: Text('This email is being used by another account'),
          //     duration: Duration(seconds: 10),
          //     action: SnackBarAction(
          //       label: 'OK',
          //       onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Auth()));

          print('run');
          // user = (await _auth.createUserWithEmailAndPassword(
          //         email: email, password: password))
          //     .user;
          // print(email);

        }
      } catch (err) {
        var message = 'An error occurred, please check your credentials!';
        if (err.message != null) {
          message = err.message;
        }
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(message),
            backgroundColor: Theme.of(context).errorColor));
      } catch (err) {
        print(err);
      }

      print(userdata.email + '  email');
      print(userdata.name);
      print(userdata.isRegistered);
      print(userdata.password);
      print(userdata.phone.toString());
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  welcomeDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hasFloatingPlaceholder: true,
                        labelText:
                            'Welcome' + '  ' + userdata.name.toUpperCase(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
                          child: Text(
                            "Ok",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void showInSnackBar(String value) {
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text(value)));
  }
}
