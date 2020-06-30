
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/perfilAPI.dart';

const URL_BASE = "https://api.github.com/users/";    //definindo a url base da api do github

class Api{
  
  Future<Map> pesquisa(String user) async {     //criando uma metodo para retornar um Map Future com os dados fornecido pela api

    http.Response response;
    String url="$URL_BASE$user";
    print(url);
    response = await http.get(url);       //requisição de dados

    if(response.statusCode == 200){       //teste se a requisição ocorreu bem

      var dadosJson = json.decode(response.body);     //converta json para map
      print("Deu certo!"+ dadosJson["login"].toString());
      return dadosJson;                     //retorne o Map com os dados

    }else{

      print("Deu Erro! ${response.statusCode.toString()}");       //trate o erro, ou não
      Map<String, dynamic> erro;
      erro["name"] = "Usuario não encontrado";
      erro["login"] = "Usuario não encontrado";
      return erro;

    }
  }

}