import 'package:app_live_est/api_github.dart';
import 'package:app_live_est/model/perfilAPI.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';


class perfil extends StatefulWidget {
  @override
  _perfilState createState() => _perfilState();
}

class _perfilState extends State<perfil> {

  TextEditingController _userController = TextEditingController();
  var perfil;
  String _user = "#";   //inicializar a variavel para n ocorrer algum erro com a pesquisa
  List dados;


  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Column(
      children: <Widget>[

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 300,
              child: TextField(
                scrollPadding: EdgeInsets.all(12),     //campo de texto para receber um valor do usuario para fazer a pesquisa
                decoration: InputDecoration(
                  labelText: 'Digite seu user',
                ),
                controller: _userController,
              )
            ),

        GestureDetector(                      //icone de lupa para fazer a pesquisa
          child: Icon(Icons.search),
          onTap: (){
            setState(() {
              _user = _userController.text;
            });
          },
              )
          ],
        ),

        Container(

          padding: EdgeInsets.only(top:12),

          child: FutureBuilder<Map>(      

            future:Api().pesquisa(_user),  //passe a função que irá retornar o MAP de dados da api

            builder: (context, snapshot){

              String resultado;

              switch(snapshot.connectionState){       //testar se a conex]ao foi bem sucedida

                case ConnectionState.none:
                  print("none");
                  break;

                case ConnectionState.waiting:
                  print("Waiting");
                  resultado = "loading...";
                  break;

                case ConnectionState.active:
                  print("Active");
                  break;

                case ConnectionState.done:
                  print("done");

                  if(snapshot.hasError){    //teste de erro no objeto snapshot
                    
                    print("erro ${snapshot.error.toString()}");

                    return Center(
                      child: Text("Nada a ser exibido!!"),
                        );

                  }else{    //pegando dados do map e colocando em uma lista

                    perfil = snapshot.data;

                    resultado = "${perfil["name"]}"; 

                    print(perfil["avatar_url"].toString()); 

                    dados = [
                      "Nome: $resultado",
                      "Login: ${perfil["login"]}",
                      "ID: ${perfil["id"]}",
                      "Seguidores: ${perfil["followers"]}",
                      "Repositórios: ${perfil["public_repos"]}",
                      "Companhia: ${perfil["company"]}"
                      ]; 

                      print(dados);

                }
                  break;      
            }

            return Column(  //construindo a interface mostrando os dados da api na tela

                        children: <Widget>[   

                          Padding(  
                            padding: EdgeInsets.all(16),
                            child: ClipRRect(
                            borderRadius: BorderRadius.circular(90.0),               
                            child: Image.network('${perfil["avatar_url"].toString()}', width:200, height: 200,), //imagem da api
                          ),
                          ),

                          SizedBox(    
                            height: 200,
                            child: ListView.separated(          //list view com dados de texto da api                 
                              itemCount: dados.length,
                              itemBuilder: (context, index){  
                                return ListTile(
                                  title: Text(dados[index]),
                                );
                              },
                              separatorBuilder:(context, index) => Divider(),
                              )                         
                          ) 

                          
                ],

              );
            
          
        } 
        )
        )
      ],
    )
    );
  }
}