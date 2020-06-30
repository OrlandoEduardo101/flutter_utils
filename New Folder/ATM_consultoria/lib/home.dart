//import 'dart:html';
//import 'dart:js';
import 'package:ATM_Consultoria/cliente.dart';
import 'package:ATM_Consultoria/contato.dart';
import 'package:ATM_Consultoria/empresa.dart';
import 'package:ATM_Consultoria/servico.dart';
import 'package:flutter/material.dart';




class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  void _abrirEmpresa(){
    Navigator.push(
      context, 
      MaterialPageRoute(
      builder: (context) => Empresa()
    ));
    print("Fala zeze, bom dia cara");
  }
   void _abrirServico(){
    Navigator.push(
      context, 
      MaterialPageRoute(
      builder: (context) => Servico()
    ));
    print("Fala zeze, bom dia cara");
  }
   void _abrirCliente(){
    Navigator.push(
      context, 
      MaterialPageRoute(
      builder: (context) => Cliente()
    ));
    print("Fala zeze, bom dia cara");
  }
   void _abrirContato(){
    Navigator.push(
      context, 
      MaterialPageRoute(
      builder: (context) => Contato()
    ));
    print("Fala zeze, bom dia cara");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("ATM Consultoria"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column( mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            Image.asset('image/logo.png'),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: _abrirEmpresa,
                  child: Image.asset('image/menu_empresa.png'),
                ),
                 GestureDetector(
                  onTap: _abrirServico,
                  child: Image.asset('image/menu_servico.png'),
                ),
               // Image.asset('image/menu_empresa.png'),
               // Image.asset('image/menu_servico.png'),
              ]
            ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32),        
            child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                 GestureDetector(
                  onTap: _abrirCliente,
                  child: Image.asset('image/menu_cliente.png'),
                 ),
                   GestureDetector(
                  onTap: _abrirContato,
                  child: Image.asset('image/menu_contato.png'),
                   )
                //Image.asset('image/menu_cliente.png'),
                //Image.asset('image/menu_contato.png'),
              ]
            ) ,
            ),
           ]
          ),
        ),
    );
  }
}