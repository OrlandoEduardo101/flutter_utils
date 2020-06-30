

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  var _frases = [
    " 'A vingança nunca é plena, mata a alma e a envenena' \n " + "-Seu Madruga",
    "'Não Priemos Cânico!'\n"+"-Chapolin",
    "'O que é que há velhinho?'\n"+"-Pernalonga",
    "'Se eu não comprar o desconto é maior!'\n"+"-Jullius"
  ];
  
  var _fraseGerada = "Clique abaixo para gerar uma frase!";
  
  void _gerarFrase(){
    var numero = Random().nextInt(_frases.length);
    setState(() {
      _fraseGerada = _frases[numero];
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.red)
          ),
          child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/logo.png"),
              Text(
                _fraseGerada,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    color: Colors.black87
                ),
              ),
              RaisedButton(
                child: Text(
                  "Nova frase",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                color: Colors.redAccent,
                onPressed: _gerarFrase,
              )
            ],
          ),
        ),
      ),
    );
  }
}
