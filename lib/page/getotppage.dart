import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sahicall/authenticate/signup.dart';
import 'package:sahicall/dashboard/dashboard.dart';
import 'package:sahicall/theme.dart';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class OtpPage extends StatefulWidget {
  const OtpPage({Key key}) : super(key: key);
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String text = '';

  void _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }

  Widget otpNumberWidget(int position) {
    try {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Center(
            child: Text(
          text[position],
          style: TextStyle(color: Colors.black),
        )),
      );
    } catch (e) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
      );
    }
  }

  Future getotp() async {
    var headers = {'Content-Type': 'text/plain'};
    var request = http.Request(
        'POST', Uri.parse('http://65.0.203.222:8092/login/verify'));
    request.body =
        '''{\r\n "phoneNo":"+phoneController",\r\n "otp":"otpNumberWidget"\r\n}\r\n''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      showErrorDialog(context, await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      showErrorDialog(context, response.reasonPhrase);
    }
  }

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

  Future<bool> isAlreadyAuthenticated() async {
    var request = http.Request(
        'POST', Uri.parse('http://65.0.203.222:8092/login/verify'));
    if (StreamedResponse != null) {
      return true;
    } else {
      return false;
    }
  }

  // @action
  Future<void> getCodeWithPhoneNumber(
      BuildContext context, String phoneNumber) async {
    // isLoginLoading = true;

    // await StreamedResponse.verifyPhoneNumber(
    //     phoneNumber: phoneNumber,
    //     timeout: const Duration(seconds: 60),
    //     verificationCompleted: (StreamedResponse auth) async {
    //       await Response.fromStream(){
    //         if (value != null && value.user != null) {
    //           print('Authentication successful');
    //           onAuthenticationSuccessful(context, value);
    //         } else {
    //           loginScaffoldKey.currentState.showSnackBar(SnackBar(
    //             behavior: SnackBarBehavior.floating,
    //             backgroundColor: Colors.red,
    //             content: Text(
    //               'Invalid code/invalid authentication',
    //               style: TextStyle(color: Colors.white),
    //             ),
    //           ));
    //         }
    // };catchError((error) {
    // loginScaffoldKey.currentState.showSnackBar(SnackBar(
    //   behavior: SnackBarBehavior.floating,
    //   backgroundColor: Colors.red,
    //   content: Text(
    //     'Something has gone wrong, please try later',
    //     style: TextStyle(color: Colors.white),
    //   ),
    // ));
    // });
    // },
    // verificationFailed: (AuthException authException) {
    //   print('Error message: ' + authException.message);
    //   loginScaffoldKey.currentState.showSnackBar(SnackBar(
    //     behavior: SnackBarBehavior.floating,
    //     backgroundColor: Colors.red,
    //     content: Text(
    //       'The phone number format is incorrect. Please enter your number in E.164 format. [+][country code][number]',
    //       style: TextStyle(color: Colors.white),
    //     ),
    //   ));
    //   isLoginLoading = false;
    // },
    // codeSent: (String verificationId, [int forceResendingToken]) async {
    //   actualCode = verificationId;
    //   isLoginLoading = false;
    //   await Navigator.of(context)
    //       .push(MaterialPageRoute(builder: (_) => const OtpPage()));
    // },
    // codeAutoRetrievalTimeout: (String verificationId) {
    //   actualCode = verificationId;
    // });
  }

  // @action
  // Future<void> validateOtpAndLogin(BuildContext context, String smsCode) async {
  //   isOtpLoading = true;
  //   final AuthCredential _authCredential = PhoneAuthProvider.getCredential(
  //       verificationId: actualCode, smsCode: smsCode);

  //   await StreamedResponse(_authCredential).catchError((error) {
  //     isOtpLoading = false;
  //     otpScaffoldKey.currentState.showSnackBar(SnackBar(
  //       behavior: SnackBarBehavior.floating,
  //       backgroundColor: Colors.red,
  //       content: Text(
  //         'Wrong code ! Please enter the last code received.',
  //         style: TextStyle(color: Colors.white),
  //       ),
  //     ));
  //   }).then((StreamedResponse authResult) {
  //     if (StreamedResponse != null && StreamedResponse != null) {
  //       print('Authentication successful');
  //       onAuthenticationSuccessful(context, authResult);
  //     }
  //   });
  // }

  Future<void> onAuthenticationSuccessful(
      BuildContext context, StreamedResponse result) async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => UserDashboard()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: MyColors.primaryColorLight.withAlpha(20),
            ),
            child: Icon(
              Icons.arrow_back_ios,
              color: MyColors.primaryColor,
              size: 16,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                                'Enter 6 digits verification code sent to your number',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500))),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 500),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              otpNumberWidget(0),
                              otpNumberWidget(1),
                              otpNumberWidget(2),
                              otpNumberWidget(3),
                              otpNumberWidget(4),
                              otpNumberWidget(5),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: RaisedButton(
                      onPressed: () async {
                        if (getotp == true) {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              child: Register(),
                            ),
                          );
                        } else {
                          return getotp();
                        }
                      },
                      color: MyColors.primaryColor,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14))),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Confirm',
                              style: TextStyle(color: Colors.white),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                color: MyColors.primaryColorLight,
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  NumericKeyboard(
                    onKeyboardTap: _onKeyboardTap,
                    textColor: MyColors.primaryColorLight,
                    rightIcon: Icon(
                      Icons.backspace,
                      color: MyColors.primaryColorLight,
                    ),
                    rightButtonFn: () {
                      setState(() {
                        text = text.substring(0, text.length - 1);
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
