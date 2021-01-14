import 'package:flutter/material.dart';
import 'bloc/my_home_pageBloc.dart';
//import 'redux/my_home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePageBloc(title: 'Flutter Demo Home Page'),
    );
  }
}
