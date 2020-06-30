
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _listTarefas = [];
  TextEditingController _controllerTarefa = TextEditingController();
  Map<String, dynamic> _ultimaTarefaRemovida = Map();

  Future<File> _getFile() async{
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/dados.json");
  }

  _salvarTarefa(){

    String texto = _controllerTarefa.text;

    //Criar dados
    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = texto;
    tarefa["realizada"] = false;

    //salvar na lista de tarefas
    setState(() {
      _listTarefas.add(tarefa);
    });
    _salvarArquivo();
    _controllerTarefa.text = "";

  }

  _salvarArquivo() async {

    var arquivo = await _getFile();

    String dados = json.encode(_listTarefas);
    arquivo.writeAsString(dados);

  }

  _lerArquivo() async {
    try{

      final arquivo = await _getFile();
      return arquivo.readAsString();

    }catch(e){
      print(e.toString());
      return null;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lerArquivo().then((dados){
      setState(() {
        _listTarefas = json.decode(dados);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("itens:"+ DateTime.now().millisecondsSinceEpoch.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tarefas"),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.purple,
          onPressed: (){
            print("fala zeze");
            showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    title: Text("Adicionar Tarefa"),
                    content: TextField(
                      cursorColor: Colors.purple,
                      controller: _controllerTarefa,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.purple,
                          )
                        ),
                        labelText: "Digite sua tarefa",
                        //focusColor: Colors.purple,
                        labelStyle: TextStyle(
                            color: Colors.purple
                        ),
                      ),
                      onChanged: (text){
                        
                      },
                    ),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Cancelar",
                          style: TextStyle(
                            color: Colors.purple,
                          ),
                          )),
                      FlatButton(
                          onPressed: (){
                            _salvarTarefa();
                            Navigator.pop(context);
                          },
                          child: Text("Salvar",
                            style: TextStyle(
                              color: Colors.purple,
                            ),
                          ))
                    ],
                  );
                }
            );
          }
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: _listTarefas.length,
                  itemBuilder: criarItemList
              )
          )
        ],
      ),

    );
  }

  Widget criarItemList(context, index){

    //final item = _listTarefas[index]["titulo"];

    return Dismissible(
        key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
        direction: DismissDirection.endToStart,
        onDismissed: (direction){
          
          //recuperar o ultimo excluído
          _ultimaTarefaRemovida = _listTarefas[index];
          
          //remove item
          _listTarefas.removeAt(index);
          _salvarArquivo();
          
          //snackbar
          final snackbar = SnackBar(
              //backgroundColor: Colors.green,
              duration: Duration(seconds: 5),
              content: Text("Tarefa removida!!!"),
              action: SnackBarAction(
                  label: "Desfazer",
                  onPressed: (){
                      //insere novamente na lista
                    setState(() {
                      _listTarefas.insert(index, _ultimaTarefaRemovida);
                    });
                    _salvarArquivo();
                  }
              ),
          );
          Scaffold.of(context).showSnackBar(snackbar);
        },
        background: Container(
          color: Colors.red,
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(
                Icons.delete,
                color: Colors.white,
              )
            ],
          ),
        ),
        child: CheckboxListTile(
            activeColor: Colors.purple,
            title: Text(_listTarefas[index]['titulo']),
            value: _listTarefas[index]['realizada'],
            onChanged: (valorAlterado){
              setState(() {
                _listTarefas[index]['realizada'] = valorAlterado;
              });
              _salvarArquivo();
              print("Valor:"+valorAlterado.toString());
            }
        )
    );
  }

}
