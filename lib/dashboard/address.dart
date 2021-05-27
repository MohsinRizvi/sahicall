import 'package:flutter/material.dart';
import 'package:nice_button/nice_button.dart';
import 'package:sahicall/theme.dart';

// ignore: camel_case_types
class address extends StatefulWidget {
  @override
  _addressState createState() => _addressState();
}

class _addressState extends State<address> {
  // ignore: non_constant_identifier_names
  TextEditingController SetLocation = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: MyColors.primaryColor,
            body: SafeArea(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(children: <Widget>[
                      Expanded(
                          flex: 0,
                          child: Column(children: <Widget>[
                            Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                child: Stack(children: <Widget>[
                                  Center(
                                    child: Container(
                                      height: 240,
                                      constraints:
                                          const BoxConstraints(maxWidth: 500),
                                      margin: const EdgeInsets.only(top: 180),
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        14.0, 180.0, 14.0, 20.0),
                                    child: Material(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.grey.withOpacity(0.2),
                                      elevation: 0.0,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 0.0),
                                        child: ListTile(
                                          title: TextFormField(
                                            keyboardType: TextInputType.text,
                                            controller: SetLocation,
                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey
                                                          .withOpacity(0.0),
                                                      width: 2.0),
                                                ),
                                                labelText: 'Set Location',
                                                hintText:
                                                    "Search For Area,Street name..",
                                                icon: Icon(Icons.search),
                                                border: InputBorder.none),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Required';
                                              } else
                                                return null;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30.0, 330.0, 20.0, 20.0),
                                    child: NiceButton(
                                      width: 255,
                                      elevation: 8.0,
                                      radius: 52.0,
                                      text: "Update",
                                      background: MyColors.primaryColor,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        14.0, 250.0, 14.0, 20.0),
                                    child: Material(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.grey.withOpacity(0.2),
                                      elevation: 0.0,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 0.0),
                                        child: ListTile(
                                          title: TextFormField(
                                            keyboardType: TextInputType.text,
                                            controller: SetLocation,
                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey
                                                          .withOpacity(0.0),
                                                      width: 2.0),
                                                ),
                                                labelText: 'Gprs Location',
                                                hintText:
                                                    "Using gprs location..",
                                                icon:
                                                    Icon(Icons.gps_fixed_sharp),
                                                border: InputBorder.none),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Required';
                                              } else
                                                return null;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(top: 20),
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              GestureDetector(
                                                child: Icon(
                                                  Icons.arrow_back,
                                                  color: Colors.white,
                                                ),
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 40),
                                          Text(
                                            "Address",
                                            style: TextStyle(
                                                fontSize: 30.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]))
                          ]))
                    ])))));
  }
}
