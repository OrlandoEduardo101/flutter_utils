import 'dart:math';

import 'package:Cara_Coroa/play.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    
    void _exibirResultado(){
      int numero;
      setState(() {
         numero = Random().nextInt(2);
      });
      Navigator.push(context,
      MaterialPageRoute(builder: (context) => Play(num: numero) ));
    print("fala zeze");
  }
    return Scaffold(
      backgroundColor: Color(0xff61bd86),
      
      body: Container(
        child:Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset('image/logo.png'),
            GestureDetector(
              child: Image.asset('image/botao_jogar.png'),
              onTap: _exibirResultado,
            )
          ]
        )
      ),
    );
  }
}