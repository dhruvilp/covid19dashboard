import 'package:coronavirus_dashboard/dashboard.dart';
import 'package:coronavirus_dashboard/style.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COVID19 Dashboard',
      theme: kLightTheme,
      darkTheme: kDarkTheme,
      home: Dashboard(),
    );
  }
}