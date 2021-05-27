import 'dart:ffi';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sahicall/theme.dart';
import 'getotppage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();
  var _dialCode = '';
  Future<Void> verifynumber() async {
    var request = http.Request('POST',
        Uri.parse('http://65.0.203.222:8092/login/generateOTP/+919521547520'));
    request.body = '''''';

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      showErrorDialog(context, await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      showErrorDialog(context, response.reasonPhrase);
    }
    if (phoneController.text.isEmpty) {
      showErrorDialog(context, response.reasonPhrase);
    } else {
      final response = await Navigator.pushNamed(context, '/OtpPage',
          arguments: '$_dialCode${phoneController.text}');
      if (response != null) {
        showErrorDialog(context, response as String);
      }
    }
  }

  void _callBackFunction(String name, String dialCode, String flag) {
    _dialCode = dialCode;
  }

  //Alert dialogue to show error and response
  void showErrorDialog(BuildContext context, String message) {
    // set up the AlertDialog
    final CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: const Text('Error'),
      content: Text('\n$message'),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('Yes'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 0,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: Container(
                              height: 240,
                              constraints: const BoxConstraints(maxWidth: 500),
                              margin: const EdgeInsets.only(top: 0),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                            ),
                          ),
                          Center(
                            child: Container(
                              constraints: const BoxConstraints(maxHeight: 340),
                              margin: const EdgeInsets.symmetric(horizontal: 0),
                              // child:
                              //     Image.asset('assets/img/login.png')
                              child: Stack(
                                children: <Widget>[
                                  ClipPath(
                                    clipper: OvalBottomBorderClipper(),
                                    child: Container(
                                      height: 230,
                                      color: MyColors.primaryColor,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(top: 0),
                                    padding: const EdgeInsets.all(0),
                                    child: Column(
                                      children: <Widget>[
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.start,
                                        //   children: <Widget>[
                                        //     GestureDetector(
                                        //       child: Icon(
                                        //         Icons.arrow_back,
                                        //         color: Colors.white,
                                        //       ),
                                        //       onTap: () {
                                        //         Navigator.pop(context);
                                        //       },
                                        //     )
                                        //   ],
                                        // ),

                                        SizedBox(height: 60),
                                        Text(
                                          "Sahi Call",
                                          style: TextStyle(
                                              fontSize: 30.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 300,
                                ),
                                Container(
                                    constraints:
                                        const BoxConstraints(maxWidth: 500),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(children: <TextSpan>[
                                        TextSpan(
                                            text: 'We will send you an ',
                                            style: TextStyle(
                                                color: MyColors.primaryColor)),
                                        TextSpan(
                                            text: 'One Time Password ',
                                            style: TextStyle(
                                                color: MyColors.primaryColor,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: 'on this mobile number',
                                            style: TextStyle(
                                                color: MyColors.primaryColor)),
                                      ]),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      14.0, 8.0, 14.0, 8.0),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey.withOpacity(0.2),
                                    elevation: 0.0,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 12.0),
                                      child: ListTile(
                                        title: TextFormField(
                                          keyboardType: TextInputType.phone,
                                          controller: phoneController,
                                          decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey
                                                        .withOpacity(0.0),
                                                    width: 2.0),
                                              ),
                                              hoverColor: MyColors.primaryColor,
                                              labelText: 'Number',
                                              fillColor: MyColors.primaryColor,
                                              hintText: "+91-000000000",
                                              icon: Icon(
                                                Icons.domain_verification,
                                                color: MyColors.primaryColor,
                                              ),
                                              border: InputBorder.none),
                                          validator: (value) {
                                            if (value.length > 10 &&
                                                value.length < 10) {
                                              showErrorDialog(context,
                                                  "Please Provide Valid Number");
                                            }
                                            return "REQUIRED";
                                          },
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(13)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  constraints:
                                      const BoxConstraints(maxWidth: 500),
                                  child: RaisedButton(
                                    onPressed: () {
                                      if (phoneController.text.isNotEmpty) {
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType
                                                .rightToLeftWithFade,
                                            child: OtpPage(),
                                          ),
                                        );
                                      } else {
                                        SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.red,
                                          content: Text(
                                            'Please enter a phone number',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        );
                                      }
                                    },
                                    color: MyColors.primaryColor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(14))),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Next',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(0.0),
                                            margin: const EdgeInsets.all(0.0),
                                            height: 30,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20)),
                                              color: MyColors.primaryColorLight,
                                            ),

                                            child: IconButton(
                                              // iconSize: 14,
                                              icon: Icon(
                                                Icons.arrow_forward_ios,
                                                size: 16,
                                                color: Colors.white,
                                              ),
                                              onPressed: verifynumber,
                                            ),
                                            //     RaisedButton(
                                            //   onPressed: verifynumber,
                                            // ),
                                            //     Icon(
                                            //   Icons.arrow_forward_ios,
                                            //   color: Colors.white,
                                            //   size: 16,
                                            // ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
