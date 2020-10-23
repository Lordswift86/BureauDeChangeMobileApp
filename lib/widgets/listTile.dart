import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  Function route;
  String mytitle;
  MyListTile(this.route, this.mytitle);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        enabled: true,
        onTap: () => route,
        tileColor: Colors.grey,
        selectedTileColor: Colors.lightBlue,
        title: Text(
          mytitle,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ));
  }
}
