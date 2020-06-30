import 'package:flutter/material.dart';

class Contato extends StatefulWidget {
  @override
  _ContatoState createState() => _ContatoState();
}

class _ContatoState extends State<Contato> {
    String ipsum = ("\n atendimento@atmconsultoria.com \n \n Telefone: (75) 9 9999-9999 \n\n Whatsapp: (75) 9 8888-8888");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:Text("Contato"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView( 
       child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('image/detalhe_contato.png'),
                Text("Fale conosco",
                style: TextStyle(
                  //color: Colors.orange,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                ), 
                ]
              ),
              Text(ipsum,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}