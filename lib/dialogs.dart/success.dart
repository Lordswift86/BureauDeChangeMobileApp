import 'package:flutter/material.dart';

class SaveDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  void _showDialog() {
    // flutter defined function
    showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Success"),
            content: new Text(
                "Email confirmation has been sent to your email address"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
