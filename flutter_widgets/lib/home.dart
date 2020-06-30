import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _lista = ["Texto 1", "Texto 2", "Texto 3", "Texto 4"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: _lista.length,
                  itemBuilder: (context, index){
                    final item = _lista[index];
                      return Dismissible(
                          background: Container(
                            color: Colors.green,
                            padding: EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                          secondaryBackground: Container(
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
                          direction: DismissDirection.horizontal,
                          onDismissed: (direction){

                              if(direction == DismissDirection.endToStart){
                                   print("delete");
                              }else if(direction == DismissDirection.startToEnd){
                                   print("edit");
                              }

                              setState(() {
                                _lista.removeAt(index);
                              });

                            print("direcao:" + direction.toString());
                          },
                          key: Key(item),
                          child: ListTile(
                            title: Text(item),
                          )
                      );
                  }
              )
          )
        ],
      ),
    );
  }
}
