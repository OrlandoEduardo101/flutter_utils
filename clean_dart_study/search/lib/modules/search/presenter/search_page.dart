import 'package:clean_dart_study/modules/search/presenter/search_bloc.dart';
import 'package:clean_dart_study/modules/search/presenter/states/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final bloc = Modular.get<SearchBloc>();
  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: TextField(
              onChanged: bloc.add,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Search...'),
            ),
          ),
          Expanded(
            child: StreamBuilder<Object>(
                stream: bloc,
                builder: (context, snapshot) {
                  final state = bloc.state;
                  if (state is SearchStart) {
                    return Center(
                      child: Text('Write a text'),
                    );
                  }
                  if (state is SearchError) {
                    return Center(
                      child: Text('Has error'),
                    );
                  }
                  if (state is SearchLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final list = (state as SearchSucces).list;
                  //print('item name ${list[0].title}');
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (_, id) {
                      final item = list[id];
                      
                      return ListTile(
                        title: Text(item.title ?? ''),
                        subtitle: Text(item.content ?? ''),
                        leading: CircleAvatar(
                          backgroundImage:
                              item.img == null ? null : NetworkImage(item.img),
                        ),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
