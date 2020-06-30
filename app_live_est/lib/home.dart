import 'package:app_live_est/camera.dart';
import 'package:app_live_est/inicio.dart';
import 'package:app_live_est/perfil.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  var cameras;
  String nome;
  Home(this.cameras, this.nome);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indice = 0; //inicializando o indice, aqui define qual tela será carregada logo após o login
  
  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [     //lista de widgets com a chamada para cada tela
        inicio(widget.nome),
        perfil(),
        Camera(widget.cameras)
  ];
  
    return Scaffold(    //construção da base da view

      appBar: AppBar(     
        title: Text("App Live Home"),
        backgroundColor: Colors.redAccent,
      ),

      body: Container(        //construido o corpo onde será carregada cada tela
        padding: EdgeInsets.all(16),
        child: telas[_indice], //passando a lista de telas
        ),

      bottomNavigationBar: BottomNavigationBar(     //barra de navegação

        currentIndex: _indice,

        onTap: (index){

          setState(() {
            _indice = index;
          });
          print(_indice);
        },

        items: [       //criando os itens da barra inferior
        BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('Home')),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle),title: Text('Perfil')),
        BottomNavigationBarItem(icon: Icon(Icons.camera), title: Text('Câmera')),
      ]),

    );
  }
}