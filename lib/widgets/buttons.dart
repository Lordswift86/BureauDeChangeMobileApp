import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  Function buttonPressed;
  String buttonLabel;
  Buttons(
    @required this.buttonLabel,
    this.buttonPressed,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: ButtonTheme(
        minWidth: 150,
        height: 50,
        child: FlatButton(
          color: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
