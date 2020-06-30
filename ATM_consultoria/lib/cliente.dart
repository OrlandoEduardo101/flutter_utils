import 'package:flutter/material.dart';

class Cliente extends StatefulWidget {
  @override
  _ClienteState createState() => _ClienteState();
}

class _ClienteState extends State<Cliente> {
    String ipsum = ("");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:Text("Cliente"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView( 
       child: Container(
          padding: EdgeInsets.all(16),
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('image/detalhe_cliente.png'),
                Text("Área do Cliente",
                style: TextStyle(
                  //color: Colors.orange,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                ), 
                ]
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Image.asset("image/cliente1.png"),
              ),
              Text(
                "Empresa de software"
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Image.asset("image/cliente2.png"),
              ),
              Text(
                "Empresa de auditoria"
              ),
            
            
            ],
          ),
        ),
      ),
    );
  }
}