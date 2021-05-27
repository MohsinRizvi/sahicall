import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sahicall/cleaning/cleaningusers.dart';
import 'package:sahicall/dashboard/address.dart';
import 'package:sahicall/dashboard/coursel.dart';
import 'package:sahicall/electrician/electicianusers.dart';
import 'package:sahicall/grooming/groomusers.dart';
import 'package:sahicall/plumber/plumberusers.dart';
import 'package:sahicall/theme.dart';

class UserDashboard extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sahi Call',
      home: MyHomePage(),
    );
  }
}

Color color = Colors.white;
String disp = '';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  List cardList = [Item1(), Item2(), Item3(), Item4()];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: MyColors.primaryColor,
        animationCurve: Curves.easeInOut,
        height: 70,
        animationDuration: Duration(milliseconds: 600),
        items: [
          Icon(
            Icons.home,
            size: 40,
            color: MyColors.primaryColor,
          ),
          Icon(
            Icons.book_outlined,
            size: 40,
            color: MyColors.primaryColor,
          ),
          Icon(
            Icons.card_giftcard,
            size: 30,
            color: MyColors.primaryColor,
          ),
          Icon(
            Icons.perm_identity,
            size: 30,
            color: MyColors.primaryColor,
          ),
        ],
        onTap: (index) {
          setState(() {
            if (index == 0) {
              disp = '';
              color = Colors.white;
            } else if (index == 1) {
              disp = '';
              color = Colors.blue;
            } else if (index == 2) {
              disp = '';
              color = Colors.teal;
            } else {
              disp = '';
              color = Colors.deepPurple;
            }
          });
        },
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
            height: 280,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: MyColors.primaryColor,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 15.0),
                  child: Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 150.0,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          pauseAutoPlayOnTouch: true,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        ),
                        items: cardList.map((card) {
                          return Builder(builder: (BuildContext context) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.30,
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                color: Colors.white,
                                child: card,
                              ),
                            );
                          });
                        }).toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: map<Widget>(cardList, (index, url) {
                          return Container(
                            width: 10.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == index
                                  ? Colors.blueAccent
                                  : Colors.grey,
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 8.0, 10.0, 5.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.withOpacity(0.2),
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: ListTile(
                        title: TextFormField(
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.0),
                                    width: 2.0),
                              ),
                              hintText: "Hello Karan",
                              icon: Icon(Icons.search),
                              border: InputBorder.none),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon

                            Icons.location_on,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: address(),
                              ),
                            );
                            // Update the state i.e. toogle the state of passwordVisible variable
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 240.0, 14.0, 10.0),
                  child: ListTile(
                    title: Row(
                      children: [
                        Text(
                          "Find Services",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.fromLTRB(14.0, 180.0, 14.0, 8.0),
                //   child: Material(
                //     borderRadius: BorderRadius.circular(10.0),
                //     color: Colors.grey.withOpacity(0.2),
                //     elevation: 0.0,
                //     child: Padding(
                //       padding: const EdgeInsets.only(left: 12.0),
                //       child: ListTile(
                //         title: Row(
                //           children: [
                //             Text(
                //               "",
                //               style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   color: Colors.white,
                //                   fontSize: 25.0),
                //             ),
                //             Text(
                //               'Number of Reviews: ',
                //               style: TextStyle(
                //                   fontSize: 15,
                //                   color: Colors.white,
                //                   fontWeight: FontWeight.bold),
                //             ),
                //             SizedBox(height: 5),
                //             // SmoothStarRating(
                //             //     allowHalfRating: true,
                //             //     starCount: 5,
                //             //     size: 24.0,
                //             //     color: Colors.amber,
                //             //     borderColor: Colors.amber,
                //             //     spacing: 0.0),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 10),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: <Widget>[
                  Expanded(
                    child: ServiceButton(
                        Icons.electrical_services, "Electrician", () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: ElectricianUsers(),
                        ),
                      );
                    }),
                  ),
                  Expanded(
                    child: ServiceButton(Icons.family_restroom, "Grooming", () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: GroomingUsers(),
                        ),
                      );
                    }),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child:
                        ServiceButton(Icons.cleaning_services, "Cleaning", () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: CleaningUsers(),
                        ),
                      );
                    }),
                  ),
                  Expanded(
                    child: ServiceButton(Icons.plumbing, "Plumber", () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: PlumberUsers(),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}

class ServiceButton extends StatelessWidget {
  final IconData icn;
  final String name;
  final Function onPress;
  ServiceButton(this.icn, this.name, this.onPress);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 20, right: 20, bottom: 20),
      height: 150,
      width: 155,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: RaisedButton(
        padding: EdgeInsets.all(12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
        ),
        color: Colors.white,
        onPressed: onPress,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  gradient: LinearGradient(
                      begin: FractionalOffset.bottomCenter,
                      end: FractionalOffset.topLeft,
                      colors: [
                        // Colors.blue,
                        MyColors.primaryColor,
                        // Color(0xff30bc68),
                        MyColors.primaryColor,
                      ])),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(
                  icn,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name.toUpperCase(),
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
