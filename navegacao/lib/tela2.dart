import 'package:flutter/material.dart';

class Tela2 extends StatefulWidget {

String valor;
Tela2({this.valor});

  @override
  _Tela2State createState() => _Tela2State();
}

class _Tela2State extends State<Tela2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text("tela2"),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text("Tela 2! Valor: ${widget.valor}")
          ],
        ),
      ),
    );
  }
}