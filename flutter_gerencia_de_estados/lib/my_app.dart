import 'package:flutter/material.dart';
import 'rx_triple/my_home_pageRXtriple.dart';
//import 'redux/my_home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePageRXtriple(title: 'Flutter Demo Home Page'),
    );
  }
}
