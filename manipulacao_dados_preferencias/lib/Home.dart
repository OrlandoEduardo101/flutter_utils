import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerCampo = TextEditingController();
  String _textoSalvo = "Nada Salvo!";

  _salvar() async{

    String valorDigitado = _controllerCampo.text;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("nome", valorDigitado);

    print("Salvo: $valorDigitado");

  }

  _ler() async {

    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _textoSalvo = prefs.getString("nome") ?? "Sem valor";
    });

    print("Ler: $_textoSalvo");

  }
  _remover() async {

    final prefs = await SharedPreferences.getInstance();
    prefs.remove("nome");

    print("removeu");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de dados"),
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
              child: Column(
          children: <Widget>[
            Text(_textoSalvo,
            style: TextStyle(
                  fontSize: 20
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite Algo",
              ),
              controller: _controllerCampo,
            ),
            Padding(padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                  child: Text("Salvar",
                      style: TextStyle(
                        fontSize: 20
                      ),
                  ),

                    onPressed: _salvar
                ),
                RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text("Ler",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),

                    onPressed: _ler
                ),
                RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text("Remover",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),

                    onPressed: _remover
                ),
              ],
            )
      )
      ],
      ),
      ),
    );
  }
}
