import 'package:Flutter/widgets/textField.dart';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          MyTextField(
            myLabelText: 'FullName',
            myHintText: 'Emmie bisi',
          )
        ],
      ),
    );
  }
}
