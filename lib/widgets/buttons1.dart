import 'package:flutter/material.dart';

class Buttons1 extends StatelessWidget {
  var buttonPressed;
  String buttonLabel;
  Color myColor;
  Buttons1(this.buttonLabel, this.buttonPressed, this.myColor);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ButtonTheme(
        minWidth: 150,
        height: 50,
        child: RaisedButton(
          elevation: 20,
          color: myColor,
          onPressed: buttonPressed,
          child: Text(
            buttonLabel,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
