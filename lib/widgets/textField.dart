import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../sharedData/DataPage.dart';

class MyTextField extends StatelessWidget {
  DataPage dataPage = DataPage();
  Function myAutoValidate;
  TextInputType myKeyboardType;
  String myLabelText;
  String myHintText;
  bool myObscureText = false;
  Function myValidators;
  Function myOnSaved;
  Function myOnChanged;
  String myInitialCountryCode;
  TextEditingController myTextController;
  MyTextField(
      {this.myKeyboardType,
      @required this.myLabelText,
      @required this.myHintText,
      @required this.myValidators,
      this.myInitialCountryCode,
      this.myOnSaved,
      this.myOnChanged,
      this.myTextController,
      this.myObscureText});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: myObscureText,
      keyboardType: myKeyboardType,
      keyboardAppearance: Brightness.dark,
      decoration: InputDecoration(
        labelText: myLabelText,
        labelStyle: TextStyle(color: Colors.white),
        hintText: myHintText,
        hintStyle: TextStyle(color: Colors.grey),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
      ),
      // The validator receives the text that the user has entered.
      validator: myValidators,
      // (value) {
      //   if (value.isEmpty) {
      //     return 'The fields can\'t be empty';
      //   }
      //   return null;
      // },
      controller: myTextController,
      onChanged: myOnChanged,
      onSaved: myOnSaved,
    );
  }

  Widget myCountryCode() {
    return IntlPhoneField(
      decoration: InputDecoration(
        labelText: myLabelText,
        labelStyle: TextStyle(color: Colors.white),
        hintText: myHintText,
        hintStyle: TextStyle(color: Colors.grey),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      initialCountryCode: myInitialCountryCode,
      onChanged: (phone) {
        print(phone.completeNumber);
      },
    );
  }
}
