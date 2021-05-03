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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Column(
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
                          child: ExpansionTile(
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
    )
    );
  }
}