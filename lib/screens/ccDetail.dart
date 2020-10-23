import 'package:Flutter/screens/homePage.dart';
import 'package:Flutter/sharedData/DataPage.dart';
import 'package:Flutter/widgets/appbar.dart';
import 'package:Flutter/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
import '../dialogs.dart/welcome.dart';
import '../sharedData/DataPage.dart';

class CcDetails extends StatefulWidget {
  @override
  _CcDetailsState createState() => _CcDetailsState();
}

class _CcDetailsState extends State<CcDetails> {
  CcData ccdata = CcData();
  bool showBack = false;

  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = new FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

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
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: MyAppBar('Credit Card Details'),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              CreditCard(
                cardNumber: ccdata.cardNum,
                cardExpiry: ccdata.ccDate,
                cardHolderName: ccdata.cardHolder,
                cvv: ccdata.cvv,
                bankName: "Cridet Card",
                showBackSide: showBack,
                frontBackground: CardBackgrounds.black,
                backBackground: CardBackgrounds.white,
                showShadow: true,
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: "Card Number"),
                      maxLength: 19,
                      onChanged: (value) {
                        setState(() {
                          ccdata.cardNum = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: "Card Expiry"),
                      maxLength: 5,
                      onChanged: (value) {
                        setState(() {
                          ccdata.ccDate = value;
                        });
                      },
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.symmetric(
                  //     horizontal: 20,
                  //   ),
                  //   child: TextFormField(
                  //     decoration: InputDecoration(hintText: "Card Holder Name"),
                  //     onChanged: (value) {
                  //       setState(() {
                  //         cardHolderName = value;
                  //       });
                  //     },
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: "CVV"),
                      maxLength: 3,
                      onChanged: (value) {
                        setState(() {
                          ccdata.cvv = value;
                        });
                      },
                      focusNode: _focusNode,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(90, 20, 90, 50),
                    child: Center(
                      child: Buttons('Save', () {
                        _showMaterialDialog();
                      }),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Success"),
              content: new Text("Your card details have been saved"),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok!'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                )
              ],
            ));
  }
}
