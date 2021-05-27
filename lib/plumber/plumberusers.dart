import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sahicall/theme.dart';

class PlumberUsers extends StatefulWidget {
  @override
  _PlumberUsersState createState() => _PlumberUsersState();
}

class _PlumberUsersState extends State<PlumberUsers>
    with SingleTickerProviderStateMixin {
  List<int> _listitems = new List();
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 2, vsync: this);
    for (int i = 0; i < 50; i++) {
      _listitems.add(i);
      print(i);
    }
  }

  Color color = Colors.white;
  String disp = '';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Sahi Call",
      home: new Scaffold(
        appBar: new AppBar(
          leading: IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: new Text(
            "Plumber",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: MyColors.primaryColor,
        ),
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
        body: new Container(
          child: new Center(
            child: new ListView.builder(
                itemCount: _listitems.length,
                itemBuilder: (BuildContext context, int index) {
                  return new ListTile(
                    title: new Text('This is Plumber'),
                    isThreeLine: true,
                    subtitle: new Text('This is our Serivices'),
                    trailing: new Icon(Icons.close),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
