import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/material.dart';

class MyCountryCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      decoration: InputDecoration(
        labelText: 'Phone Number',
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      initialCountryCode: 'NG',
      onChanged: (phone) {
        print(phone.completeNumber);
      },
    );
  }
}
