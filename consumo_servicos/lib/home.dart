import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerCEP = TextEditingController();

  String _result="";

  
  _recuperarCep() async {
    String _cep = "44345000";
    setState(() {
      _cep = _controllerCEP.text;
    });
    String url = "https://viacep.com.br/ws/$_cep/json/";
    http.Response response;
    response = await http.get(url);
    Map<String, dynamic>  retorno = json.decode(response.body);
    String logradouro = retorno["logradouro"];
    String cep = retorno["cep"];
    String localidade = retorno["localidade"];
    String uf = retorno["uf"];
    String bairro = retorno["bairro"];
    String complemento = retorno["complemento"];
    
    setState(() {
      _result = "$logradouro, $bairro, $complemento, $localidade, $uf, $cep";
    });
    print(
      "Resposta: Localidade: $localidade UF:$uf cep:$cep"
    );
    //print("resposta: " + response.body);
    //print("resposta: " + response.statusCode.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço web")
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration:InputDecoration(
                            labelText: "digite o CEP",
                          ),
                            style: TextStyle(
                            fontSize: 22
                          ),
              controller: _controllerCEP,
            ),
            Text(_result),
            RaisedButton(
              child: Text("Buscar"),
              onPressed: _recuperarCep,
              )
          ],
        )
      ),
      
    );
  }
}