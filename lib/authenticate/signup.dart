import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sahicall/dashboard/dashboard.dart';
import '../theme.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController cityname = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController referal = TextEditingController();

  bool loading = false;

  bool _isInAsyncCall = false;

  void dialogue(String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notification'),
          content: Text(msg),
          actions: <Widget>[
            RaisedButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register()),
                );
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      opacity: 0.5,
      progressIndicator: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.teal[300]),
      ),
      child: Container(
        // color: Colors.transparent,
        // padding: EdgeInsets.only(bottom: 52),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      ClipPath(
                        clipper: OvalBottomBorderClipper(),
                        child: Container(
                          height: 200,
                          color: MyColors.primaryColor,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                              "Create Account",
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            // Image.asset(
                            //   'images/logo.png',
                            //   height: 50,
                            //   width: 100,
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey.withOpacity(0.2),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: ListTile(
                          title: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: cityname,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.0),
                                      width: 2.0),
                                ),
                                labelText: 'CityName',
                                hintText: "CityName",
                                icon: Icon(Icons.location_searching),
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
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey.withOpacity(0.2),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: ListTile(
                          title: TextFormField(
                            // ignore: missing_return
                            validator: (String value) {
                              if (!RegExp(
                                      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                  .hasMatch(value)) {
                                return 'Please enter a valid email Address';
                              }
                            },
                            onSaved: (String value) {
                              name = value as TextEditingController;
                            },
                            keyboardType: TextInputType.text,
                            controller: name,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.0),
                                      width: 2.0),
                                ),
                                labelText: 'Username',
                                hintText: "Username",
                                icon: Icon(Icons.verified_user),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey.withOpacity(0.2),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: ListTile(
                          title: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: referal,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.0),
                                      width: 2.0),
                                ),
                                labelText: 'Referal',
                                hintText: "Referal",
                                icon: Icon(Icons.code),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  //   child: Material(
                  //     borderRadius: BorderRadius.circular(10.0),
                  //     color: Colors.grey.withOpacity(0.2),
                  //     elevation: 0.0,
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(left: 12.0),
                  //       child: ListTile(
                  //         title: TextFormField(
                  //           keyboardType: TextInputType.number,
                  //           controller: number,
                  //           decoration: InputDecoration(
                  //               focusedBorder: OutlineInputBorder(
                  //                 borderSide: BorderSide(
                  //                     color: Colors.grey.withOpacity(0.0),
                  //                     width: 2.0),
                  //               ),
                  //               labelText: 'Number',
                  //               hintText: "+92-000000000",
                  //               icon: Icon(Icons.phone),
                  //               border: InputBorder.none),
                  //           validator: (value) {
                  //             if (value.isEmpty) {
                  //               return "The Number field cannot be empty";
                  //             }
                  //             return "REQUIRED";
                  //           },
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 20),
                  Container(
                    child: RaisedButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 70),
                      onPressed: () async {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeftWithFade,
                            child: UserDashboard(),
                          ),
                        );
                      },
                      color: MyColors.primaryColor,
                      elevation: 11,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50.0),
                ],
              ),
            ),
          ),
        ),
      ),
      inAsyncCall: _isInAsyncCall,
    );
  }
}
