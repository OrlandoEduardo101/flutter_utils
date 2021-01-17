import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'app_store.dart';

class MyHomePageRXtriple extends StatefulWidget {
  MyHomePageRXtriple({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageRXtriple> {
  AppStore appStore = AppStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            /*TripleBuilder(
              store: appStore,
              builder: (context, triple) => Text('${triple.state}'),
            )*/
            ScopedBuilder<AppStore, Exception, int>(
              store: appStore,
              onLoading: (context) => Center(child: CircularProgressIndicator(),),
              onError: (context, error) => Center(child: Text(error.toString()),),
              onState: (context, state) => Text(
                  '$state',
                  style: Theme.of(context).textTheme.headline4,
                ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          appStore.increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
