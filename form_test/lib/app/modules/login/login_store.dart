import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginStore {
  late String user;
  String setUser(value) => user = value;

  late String password;
  String setPassword(value) => password = value;

  Future<void> onClick(String user, String password, BuildContext context) async {
    await Future.delayed(Duration(seconds: 3)); //simulate progress of login
    if (user == 'Naruto' && password == '123456') {
      print('Usuario logado');
      Modular.to.pushNamed('/home');
    } else {
      print('falha no login');
      ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('invalid login')));
    }
  }
  
}
