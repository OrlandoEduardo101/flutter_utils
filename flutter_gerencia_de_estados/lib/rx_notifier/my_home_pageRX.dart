import 'package:flutter/material.dart';
import 'package:flutter_redux/rx_notifier/app_store.dart';
import 'package:rx_notifier/rx_notifier.dart';

class MyHomePageRX extends StatefulWidget {
  MyHomePageRX({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageRX> {
  final appStore = AppStore();
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
            RxBuilder(
              builder: (_){
              return Text(
                  '${appStore.counter.value}',
                  style: Theme.of(context).textTheme.headline4,
                );
            })
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
