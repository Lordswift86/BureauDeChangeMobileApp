import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import '../screens/buyPage.dart';
import '../screens/signup.dart';

class DataPage {
  var convertedTotal;
  String usdSellRates = '455';
  String gbpSellRates = '595';
  String eurSellRates = '445';
  String cadSellRates = '330';
  String usdBuyRates = '465';
  String gbpBuyRates = '605';
  String eurBuyRates = '455';
  String cadBuyRates = '345';
  var abokiUsdBuyRate;

  recievedRates() {}
}

class UserData {
  String _name;
  String _email;
  var _phone;
  String _password;
  var isRegistered = true;
  var ctx;
  String get phone => _phone;

  set phone(String value) => _phone = value;

  String get password => _password;

  set password(String value) => _password = value;
  String get name => _name;

  set name(String value) => _name = value;

  String get email => _email;

  set email(String value) => _email = value;
}

class CcData {
  String _cardNumber = "";
  String _cardHolderName = "";
  String _expiryDate = "";
  String _cvv = "";

  String get cardNum => _cardNumber;

  set cardNum(String value) => _cardNumber = value;

  String get cardHolder => _cardHolderName;

  set cardHolder(String value) => _cardHolderName = value;
  String get ccDate => _expiryDate;

  set ccDate(String value) => _expiryDate = value;

  String get cvv => _cvv;

  set cvv(String value) => _cvv = value;
}

class ImageSelect extends StatefulWidget {
  @override
  _ImageSelectState createState() => _ImageSelectState();
}

class _ImageSelectState extends State<ImageSelect> {
  File _image;

  @override
  Widget build(BuildContext context) {
    final picker = ImagePicker();

    Future getImage() async {
      final pickedFile = await picker.getImage(source: ImageSource.camera);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      });
    }
  }
}
