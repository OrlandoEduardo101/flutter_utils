import 'package:flutter/material.dart';
import 'mobx/my_home_pageMobx.dart';
//import 'redux/my_home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePageMobx(title: 'Flutter Demo Home Page'),
    );
  }
}
