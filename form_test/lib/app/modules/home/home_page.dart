import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'home_store.dart';
import 'widgets/custom_expansion_tile_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  var _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: ListView.builder(
        itemCount: store.listQuestionsByCategory.length,
        itemBuilder: (_, index) => CustomExpansionTileWidget(
          titleCategory: 'title $index',
          children: [
            Container(
              child: Column(
                children: [
                  TextFormField(
                    controller: _textEditingController,
                  ),
                  ElevatedButton(
                      onPressed: () => print(_textEditingController.text),
                      child: Text('manual')),
                      ElevatedButton(
                      onPressed: () => print(_textEditingController.text),
                      child: Text('importação'))
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  TextFormField(
                    controller: _textEditingController,
                  ),
                  ElevatedButton(
                      onPressed: () => print(_textEditingController.text),
                      child: Text('print'))
                ],
              ),
            )
          ],
        ),
      ),
    );

    /*Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: SingleChildScrollView(
              child: Column(
        children: store.listQuestionsByCategory
            .map(
              (item) => CustomExpansionTileWidget(
                  titleCategory: '${item.category}',
                  children: item.questions!
                      .map(
                        (question) => Padding(
                          padding: const EdgeInsets.fromLTRB(15, 13, 15, 5),
                          child: Card(
                            elevation: 0,
                            child: Container(
                              child: Column(children: [
                                TextFormField(controller: _textEditingController,),
                                ElevatedButton(onPressed: () => print(_textEditingController.text), child: Text('print'))
                              ],),
                            )
                            
                            ExpansionTile(
                              childrenPadding: EdgeInsets.fromLTRB(15, 0, 15, 20),
                              title: Text(
                                question.question!,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              children: [
                                Text(
                                  question.answer!,
                                  style: Theme.of(context).textTheme.subtitle1,
                                  textAlign: TextAlign.justify,
                                )
                              ],
                            ),
                            
                          ),
                        ),
                      )
                      .toList()),
            )
            .toList(),
    ),
      )
    );*/
  }
}
