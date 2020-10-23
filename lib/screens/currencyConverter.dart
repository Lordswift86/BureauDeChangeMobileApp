import 'package:Flutter/screens/ccDetail.dart';
import 'package:Flutter/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flag/flag.dart';
import 'package:Flutter/widgets/validator.dart';
import '../widgets/appbar.dart';
import '../sharedData/DataPage.dart';

class CurrencyConverter extends StatefulWidget {
  String amount;
  String convertedTotal = '';
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  DataPage dataPage = DataPage();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  static final MyValidator myValidator = MyValidator();

  String amount = '';
  double convertedTotal;
  String _selectedCurrency = '1';
  String _selectedLocation;
  List<Map> country = [
    {'id': '1', 'currency': 'USD', 'Image': 'US'},
    {'id': '2', 'currency': 'GBP', 'Image': 'GB'},
    {'id': '3', 'currency': 'EUR', 'Image': 'EU'},
    {'id': '4', 'currency': 'CAD', 'Image': 'CA'},
  ];
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
        drawer: MyDrawer(),
        backgroundColor: Color.fromRGBO(25, 25, 25, 21),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: MyAppBar(' Currency Converter'),
          ),
        ),
        body: Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                              minWidth: double.infinity, minHeight: 80),
                          color: Colors.grey[800],
                          padding: EdgeInsets.fromLTRB(30, 30, 0, 0),
                          child: Row(
                            children: [
                              Text(
                                'Currency',
                                style: TextStyle(fontSize: 14),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 120,
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                        minWidth: 50, minHeight: 10),
                                    color: Colors.grey[900],
                                    padding: EdgeInsets.all(5),
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        height: 50,
                                        minWidth: 20,
                                        alignedDropdown: true,
                                        child: DropdownButton<String>(
                                          isDense: true,
                                          hint: new Text("Select Currency"),
                                          value: _selectedCurrency,
                                          onChanged: (String newValue) {
                                            setState(() {
                                              clearSheet();
                                              _selectedCurrency = newValue;
                                            });
                                          },
                                          items: country.map((Map map) {
                                            return new DropdownMenuItem<String>(
                                              value: map["id"].toString(),
                                              // value: _mySelection,
                                              child: Row(
                                                children: <Widget>[
                                                  Flag(
                                                    map["Image"],
                                                    width: 25,
                                                    height: 15,
                                                  ),
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                          map["currency"])),
                                                ],
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    constraints: BoxConstraints(
                        minWidth: double.infinity, minHeight: 80),
                    color: Colors.grey[800],
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: Column(children: [
                      TextFormField(
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        keyboardAppearance: Brightness.dark,
                        decoration: InputDecoration(
                          labelText: 'Amount',
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: '1000',
                          hintStyle: TextStyle(color: Colors.grey),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent),
                          ),
                        ),
                        validator: myValidator.validateNumber,
                        onChanged: (String newValue) {
                          setState(() {
                            amount = newValue;
                            convertedRate();
                          });
                        },
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          convertedTotal.toString(),
                          style: TextStyle(color: Colors.green),
                        ),
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    constraints: BoxConstraints(
                        minWidth: double.infinity, minHeight: 80),
                    color: Colors.grey[800],
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: Center(
                      child: Text(
                        convertedTotal.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 24),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 300),
                    alignment: Alignment.topRight,
                    width: 70,
                    child: ButtonTheme(
                      minWidth: 90,
                      height: 20,
                      child: FlatButton(
                        color: Colors.grey[700],
                        onPressed: () {
                          clearSheet();
                        },
                        child: Text(
                          'Clear',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),

                    // child: Buttons('Submit', onPressed(){}),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(90, 50, 90, 50),
                    child: Center(
                      child: Container(
                        width: double.infinity,
                        child: ButtonTheme(
                          minWidth: 150,
                          height: 50,
                          child: FlatButton(
                            color: Colors.lightBlueAccent,
                            onPressed: () {
                              clearSheet();
                            },
                            child: Text(
                              'Calculate',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),

                        // child: Buttons('Submit', onPressed(){}),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
      _formKey.currentState.save();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CcDetails()));
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  clearSheet() {
    setState(() {
      amount = '0';
      convertedTotal = 0.0;
    });
  }

// multiplying rate by amount to get the total
  convertedRate() {
    var a = double.parse(dataPage.usdSellRates);
    var b = double.parse(dataPage.gbpSellRates);
    var c = double.parse(dataPage.eurSellRates);
    var d = double.parse(dataPage.cadSellRates);

    switch (_selectedCurrency) {
      case '1':
        {
          convertedTotal = a * double.parse(amount);
        }

        break;

      case '2':
        {
          convertedTotal = b * double.parse(amount);
        }

        break;

      case '3':
        {
          convertedTotal = c * double.parse(amount);
        }

        break;

      case '4':
        {
          convertedTotal = d * double.parse(amount);
        }

        break;
      default:
        {
          convertedTotal = 0.0;
        }
        break;
    }
  }
}
