import 'package:flutter/material.dart';
import 'package:sahicall/dashboard/dashboard.dart';
import 'package:sahicall/grooming/groomusers.dart';
import 'package:sahicall/page/enternumber.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sahi Call',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
