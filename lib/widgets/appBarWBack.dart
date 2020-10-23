import 'package:flutter/material.dart';

class MyAppBarWBack extends StatelessWidget {
  String titleText;
  MyAppBarWBack(this.titleText);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(20, 20, 20, 21),
      leading: BackButton(
          color: Colors.grey,
          onPressed: () {
            Navigator.of(context).pop();
          }),
      title: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: <Widget>[
            Text(titleText,
                style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 24,
                    fontWeight: FontWeight.w300)),
          ],
        ),
      ),
      centerTitle: true,
    );
  }
}
