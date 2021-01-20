import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flag/flag.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:double_back_to_close/double_back_to_close.dart';

import 'package:Flutter/screens/buyPage.dart';
import 'package:Flutter/screens/sellPage.dart';
import 'package:Flutter/widgets/drawer/drawer.dart';
import 'package:Flutter/widgets/buttons1.dart';
import '../widgets/appbar.dart';
import '../sharedData/DataPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DataPage dataPage = DataPage();
  bool allowClose = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      // double press back button to close app
      child: DoubleBack(
        condition: allowClose,
        onConditionFail: () {
          setState(() {
            allowClose = true;
          });
        },
        child: Scaffold(
          drawer: MyDrawer(),
          backgroundColor: Color.fromRGBO(25, 25, 25, 21),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: MyAppBar('Home'),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Colors.grey[800],
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.grey[900],
                        padding:
                            EdgeInsets.symmetric(horizontal: 150, vertical: 10),
                        child: Text(
                          'Exchange Rate',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      DataTable(columnSpacing: 30.0, columns: [
                        DataColumn(
                          label: Row(
                            children: [
                              myText('NG'),
                              Flag(
                                'NG',
                                width: 25,
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                        DataColumn(
                          label: Row(
                            children: [
                              myText('USD'),
                              Flag(
                                'US',
                                width: 25,
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                        DataColumn(
                          label: Row(children: [
                            myText('GBP'),
                            Flag(
                              'GB',
                              width: 25,
                              height: 15,
                            ),
                          ]),
                        ),
                        DataColumn(
                          label: Row(children: [
                            myText('Euro'),
                            Flag(
                              'EU',
                              width: 25,
                              height: 15,
                            ),
                          ]),
                        ),
                        DataColumn(
                          label: Row(children: [
                            myText('CAD'),
                            Flag(
                              'CA',
                              width: 25,
                              height: 15,
                            ),
                          ]),
                        )
                      ], rows: [
                        DataRow(
                          cells: [
                            DataCell(myText('Date')),
                            DataCell(myText('Buy/Sell')),
                            DataCell(myText('Buy/Sell')),
                            DataCell(myText('Buy/Sell')),
                            DataCell(myText('Buy/Sell')),
                          ],
                        ),
                        DataRow(cells: [
                          DataCell(myText(
                            DateTime.now().format(DateFormats.europeanAbbr),
                          )),
                          DataCell(myText(dataPage.usdBuyRates +
                              '/' +
                              dataPage.usdSellRates)),
                          DataCell(myText(dataPage.gbpBuyRates +
                              '/' +
                              dataPage.gbpSellRates)),
                          DataCell(myText(dataPage.eurBuyRates +
                              '/' +
                              dataPage.eurSellRates)),
                          DataCell(myText(dataPage.cadBuyRates +
                              '/' +
                              dataPage.cadSellRates)),
                        ]),
                        DataRow(cells: [
                          DataCell(myText(
                            DateTime.now().format(DateFormats.europeanAbbr),
                          )),
                          DataCell(myText(dataPage.usdBuyRates +
                              '/' +
                              dataPage.usdSellRates)),
                          DataCell(myText(dataPage.gbpBuyRates +
                              '/' +
                              dataPage.gbpSellRates)),
                          DataCell(myText(dataPage.eurBuyRates +
                              '/' +
                              dataPage.eurSellRates)),
                          DataCell(myText(dataPage.cadBuyRates +
                              '/' +
                              dataPage.cadSellRates)),
                        ]),
                        DataRow(cells: [
                          DataCell(myText(
                            DateTime.now().format(DateFormats.europeanAbbr),
                          )),
                          DataCell(myText(dataPage.usdBuyRates +
                              '/' +
                              dataPage.usdSellRates)),
                          DataCell(myText(dataPage.gbpBuyRates +
                              '/' +
                              dataPage.gbpSellRates)),
                          DataCell(myText(dataPage.eurBuyRates +
                              '/' +
                              dataPage.eurSellRates)),
                          DataCell(myText(dataPage.cadBuyRates +
                              '/' +
                              dataPage.cadSellRates)),
                        ]),
                        DataRow(cells: [
                          DataCell(myText(
                            DateTime.now().format(DateFormats.europeanAbbr),
                          )),
                          DataCell(myText(dataPage.usdBuyRates +
                              '/' +
                              dataPage.usdSellRates)),
                          DataCell(myText(dataPage.gbpBuyRates +
                              '/' +
                              dataPage.gbpSellRates)),
                          DataCell(myText(dataPage.eurBuyRates +
                              '/' +
                              dataPage.eurSellRates)),
                          DataCell(myText(dataPage.cadBuyRates +
                              '/' +
                              dataPage.cadSellRates)),
                        ]),
                      ]),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                  child: Center(
                    child: Row(
                      children: [
                        Buttons1(
                          'Sell',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SellPage()),
                            );
                          },
                          Colors.red,
                        ),
                        Spacer(flex: 5,),
                        Buttons1(
                          'Buy',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BuyPage()),
                            );
                          },
                          Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
    );
  }
}
