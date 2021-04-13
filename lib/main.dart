import 'package:flutter/material.dart';
import 'package:news_app/pages/Login.dart';
import 'package:news_app/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.grey[50],
      ),
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
