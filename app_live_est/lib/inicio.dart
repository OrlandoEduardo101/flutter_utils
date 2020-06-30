import 'package:flutter/material.dart';

class inicio extends StatefulWidget {
  String nome;
  inicio(this.nome);
  @override
  _inicioState createState() => _inicioState();
}

class _inicioState extends State<inicio> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Bem vindo, ${widget.nome}"),
            Padding(
              padding: EdgeInsets.all(16),
              child: Image.asset("image/unnamed.jpg"),
              ),
            Text("Login feito com sucesso")
          ],
        ),
      );
  }
}