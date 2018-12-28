import 'package:flutter/material.dart';
import 'package:flutter_ui_test_2/filter_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'AvenirLTStd',
      ),
      debugShowCheckedModeBanner: false,
      home: FilterPage(),
    );
  }
}