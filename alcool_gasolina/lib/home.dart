import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerGasolina = TextEditingController();
  TextEditingController _controllerAlcool = TextEditingController();
  String _textoResult = "";

  void _calcular(){

    double precGas = double.tryParse(_controllerGasolina.text);
    double precAlc = double.tryParse(_controllerAlcool.text);

    if(precAlc == null || precGas == null){
      print("Entrada inváldia!");
      setState(() {
        _textoResult = "entrada inválida!";
      });
    }else{
      print("Entrada válida!");

      double _resul = precAlc/precGas;

      if(_resul>(0.75)){
         setState(() {
        _textoResult = "Melhor Gasolina!";
      });
      }else if(_resul<0.65){
         setState(() {
        _textoResult = "Melhor Alcool!";
      });
      }else{
         setState(() {
        _textoResult = "Tanto Faz!";
      });
      }
       _clear();
    }


    print("Fala zeze, bom dia cara!");
  }

  void _clear(){
    _controllerAlcool.text="";
    _controllerGasolina.text="";
  }

  @override
  Widget build(BuildContext context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text("Álcool ou Gasolina", textAlign: TextAlign.center,),
                    backgroundColor: Color.fromRGBO(168, 2, 2, 1),
                  ),
                  body: 
                  Container( 
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(32),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 32),
                          child: Image.asset("images/logo.png"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text("Saiba qual combustivel está valendo mais apena",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.numberWithOptions(),
                          decoration:InputDecoration(
                            labelText: "Preço da Gasolina, Ex.: 4.59",
                          ),
                            style: TextStyle(
                            fontSize: 22
                          ),
                          controller: _controllerGasolina ,
                        ),
            
                        TextField(
                          keyboardType: TextInputType.numberWithOptions(),
                          decoration:InputDecoration(
                            labelText: "Preço do Álcool, Ex.: 3.46",
                          ),
                            style: TextStyle(
                            fontSize: 22
                          ),
                          controller: _controllerAlcool ,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: RaisedButton(
                                color: Color.fromRGBO(168, 2, 2, 1),
                                textColor: Colors.white,
                            padding: EdgeInsets.all(15),
                            child: Text("Calcular", textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            ), 
                            onPressed: () {
                              _calcular();
                            },
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:20),
                          child: Text(_textoResult, textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                          )
                          )
                        )
                      ],
                    ),
                    )
                  ),   
              );  
  }
}