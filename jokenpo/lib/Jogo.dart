import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var escolhaUser = "padrao";
  var _imagemApp = AssetImage("images/padrao.png");
  var _result = "escolha uma opção";

  void _opcaoSelecionada(String escolhaUser){
    
    var opcoes = ["pedra", "papel", "tesoura"];
    var num = Random().nextInt(3);
    var escolhaApp = opcoes[num];

    print("Opção selecionada:"+escolhaUser);
    print("escolha do app:"+escolhaApp);

    //exibir escolha do app
    switch(escolhaApp){
      case "pedra":
      setState(() {
        this._imagemApp = AssetImage("images/pedra.png");
      });
      break;

      case "papel":
      setState(() {
        this._imagemApp = AssetImage("images/papel.png");
      });
      break;

      case "tesoura":
      setState(() {
        this._imagemApp = AssetImage("images/tesoura.png");
      });
      break;

    }

    //validação vencedor
    if(
      (escolhaUser == "pedra" && escolhaApp == "tesoura") ||
      (escolhaUser == "tesoura" && escolhaApp == "papel") ||
      (escolhaUser == "papel" && escolhaApp == "pedra")
    ){
      setState(() {
        this._result = "Parabéns, você ganhou!!!" ;
      });

    }

    if(
      (escolhaUser == "tesoura" && escolhaApp == "pedra") ||
      (escolhaUser == "papel" && escolhaApp == "tesoura") ||
      (escolhaUser == "pedra" && escolhaApp == "papel")
    ){
      setState(() {
        this._result = "ohhh você é um fracasso, perdedor!" ;
      });
    }

    if(escolhaUser == escolhaApp){
       setState(() {
        this._result = "empataram!" ;
      });
    }

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JoKenPo"),
        backgroundColor: Colors.red,
      ) ,
      body: Column(//mainAxisAlignment: MainAxisAlignment.start, 
      crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top:32, bottom:16),
            child:Text(
              "Escolha do App:", 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              )
              )
          ),
          Image(image: this._imagemApp,),
          Padding(
           padding: EdgeInsets.only(top:32, bottom:16),
            child:Text(
              this._result, 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              )
          ),

           Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly, /*crossAxisAlignment: CrossAxisAlignment.end,  
              mainAxisSize: MainAxisSize.min,*/
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("images/pedra.png",height: 95,),
              ),
              GestureDetector(
                onTap: () =>  _opcaoSelecionada("papel"),
                child: Image.asset("images/papel.png",height: 95,),
              ),
              GestureDetector(
                onTap: () =>  _opcaoSelecionada("tesoura"),
                child: Image.asset("images/tesoura.png",height: 95,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}