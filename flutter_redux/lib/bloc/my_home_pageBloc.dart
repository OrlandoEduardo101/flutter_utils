import 'package:flutter/material.dart';
import 'package:flutter_redux/bloc/app_bloc.dart';

class MyHomePageBloc extends StatefulWidget {
  MyHomePageBloc({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageBloc> {
  final appBloc = AppBloc();
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
            StreamBuilder(
              stream: appBloc,
              builder: (_, __) {
                return Text(
                  //'${appStore.state.value}',
                  appBloc.state.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          appBloc.add(AppEvent.increment);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
