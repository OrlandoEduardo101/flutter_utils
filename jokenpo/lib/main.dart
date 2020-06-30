import 'package:flutter/material.dart' show MaterialApp, runApp;
import 'package:jokenpo/Jogo.dart';

void main(){
  runApp(MaterialApp(
    home: Jogo(),
    debugShowCheckedModeBanner: false,
  ));
}