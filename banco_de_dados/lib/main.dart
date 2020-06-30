import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  )
);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _recuperarBanco() async{

    final caminhoBanco = await getDatabasesPath();
    final localBanco = p.join(caminhoBanco, "banco.db");

    var db = await openDatabase(
      localBanco,
      version: 1,
      onCreate: (db, dbVersaoRecente){
        //int, varchar,text...
        String sql = "CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER)";
        db.execute(sql);
      }
    );
    return db;
   // print(caminhoBanco.toString() + "  "+localBanco.toString());
   // print("aberto:"+db.isOpen.toString());

  }

  _salvar() async {

    Database db = await _recuperarBanco();

    Map< String, dynamic> dadosUser= {
      "nome" : "Ana Maria das Dores",
      "idade" : 23

    };
    int id = await db.insert("users", dadosUser);
    print("Salvo:$id");

  }

  _listarUsers() async{

    Database db = await _recuperarBanco();

    //String sql = "SELECT * FROM users WHERE idade = 15";
    //String sql = "SELECT * FROM users WHERE idade = 15 AND id = 2";
    //String sql = "SELECT * FROM users WHERE idade BETWEEN 15 AND 30";
    //String sql = "SELECT * FROM users WHERE idade IN (15,30)";
    //String sql = "SELECT * FROM users WHERE nome LIKE 'Pedro%' ";
    //String sql = "SELECT * FROM users WHERE 1=1 ORDER BY nome ASC"; //ASC, DESC, UPPER(nome) -> letra maiscula
    //String sql = "SELECT * FROM users WHERE 1=1 ORDER BY idade DESC LIMIT 5"; //ASC, DESC,
    String sql = "SELECT * FROM users";
    List users = await db.rawQuery(sql);

    for(var users in users){
      print(
        "item id:" + users['id'].toString() + "nome:" + users['nome'] + "idade:" + users['idade'].toString()
      );
    }

    //print("users:" + users.toString());

  }

  _recuperarUser(int id) async{

    Database db = await _recuperarBanco();

    List users = await db.query(
      "users",
      columns: ["id", "nome", "idade"],
      where: "id = ?",
      whereArgs: [id]
    );

    for(var users in users){
      print(
          "item id:" + users['id'].toString() + "nome:" + users['nome'] + "idade:" + users['idade'].toString()
      );
    }

  }

  _deleteUser(int id) async {

    Database db = await _recuperarBanco();
    int retorno = await db.delete(
      "users",
      /*where: "id = ?",
      whereArgs: [id]*/
        where: "nome = ? AND idade = ?",
        whereArgs: ["Ana Leopoldina", 85]
    );
    
    print("item qtd removida: $retorno");

  }

  _atualizarUser(int id) async {

    Database db = await _recuperarBanco();

    Map< String, dynamic> dadosUser= {
      "nome" : "Maria Alemida",
      "idade" : 89

    };

    int retorno = await db.update(
        "users",
        dadosUser,
        where: "id = ?",
        whereArgs: [id]
    );
    print("item qtd atualizada: $retorno");
  }

  @override
  Widget build(BuildContext context) {
    //_atualizarUser(3);
    //_deleteUser(2);
    //_recuperarUser(3);
    _salvar();
    _listarUsers();
    //_recuperarBanco();
    return Container();
  }
}

