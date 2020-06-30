import 'package:flutter/material.dart';
import 'package:navegacao/tela2.dart';

main(){
  runApp(
    MaterialApp(
      home:Tela1(),
  ));
}

class Tela1 extends StatefulWidget {
  @override
  _Tela1State createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("tela1"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("ir pra tela 2"),
              padding: EdgeInsets.all(15),
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => Tela2(valor: "Fala zeze!")
                  )
                );
              },
            )
          ],
        ),
      ),
    );
  }
}