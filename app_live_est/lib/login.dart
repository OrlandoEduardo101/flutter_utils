

import 'package:flutter/material.dart';

import 'home.dart';

class Login extends StatefulWidget {
  var cameras;
  Login(this.cameras);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _controllerUser = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        title: Text("App Live"),
        backgroundColor: Colors.redAccent 
      ),

      body:Padding(

        padding: EdgeInsets.all(32),

        child: SingleChildScrollView(   //widget responsável pelo scroll no login, possibilitando que o layout n quebre ao abrir o teclado
          child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[

            Icon(Icons.account_circle, size: 150, color: Colors.redAccent,),

            Padding(
              padding: EdgeInsets.all(12),    //campo de texto para usuario
              child: TextField(

              keyboardType: TextInputType.emailAddress ,

              decoration: InputDecoration(
                labelText: 'Usuario',
                hintText: 'Digite seu usuario',
                border: OutlineInputBorder()
            ),

            controller: _controllerUser,

            ),
            ),

            Padding(
              padding: EdgeInsets.all(12),

              child: TextField(                    //campo de texto para senha

              keyboardType: TextInputType.number ,
              obscureText: true,

              decoration: InputDecoration(
                labelText: 'Senha',
                hintText: 'Digite sua senha',
                border: OutlineInputBorder()
              ),
              controller: _controllerPassword,
            ),

            ),

            RaisedButton(    //botão para realizar login

              color: Colors.redAccent,
              textColor: Colors.white,
              padding: EdgeInsets.fromLTRB(22,8,22,8),            
              elevation: 0.5,

              child: Text("Entrar",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize:28,
                color: Colors.white 
              ),
              ),

              onPressed: (){

                if(_controllerUser.text == 'teste' || _controllerPassword.text == '123' ){ //validando o login

                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Home(widget.cameras, _controllerUser.text) //chamando o home passando a lista de cameras
                    )

                  );

                  print("sucess");

                }else{   //tratamento login falhou

                  print("Failed");

                  showDialog( //alerta de erro
                    context: context,
                    builder: (context){
                      
                      return AlertDialog(

                    //context: context,
                    title: Text("Login failed"),
                    content: Text("você digitou algo errado"),
                    actions: <Widget>[
                      FlatButton(child: Text("Fechar"), onPressed: () => Navigator.pop(context)) //fechar o alert
                    ],

                  );

                  }
                  );
                }
              }
              ),
          ],
        ),
        )
        ),
        )
    );
  }
}