import 'package:flutter/material.dart';

class Servico extends StatefulWidget {
  @override
  _ServicoState createState() => _ServicoState();
}

class _ServicoState extends State<Servico> {
  
  String ipsum = ("\n Consultoria \n \n Cálculo de preços \n \n Acompanhamento de projetos");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:Text("Serviços"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView( 
       child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('image/detalhe_servico.png'),
                Text("Nossos serviços",
                style: TextStyle(
                  //color: Colors.orange,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                ), 
                ]
              ),
              Text(ipsum,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}