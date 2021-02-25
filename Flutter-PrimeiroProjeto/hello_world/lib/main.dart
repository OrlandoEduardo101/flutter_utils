import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool isFull = false;

  void _incrementCounter() {
    setState(() {
      if (isFull) {
      isFull = _counter == 20 ? isFull = !isFull : isFull;
      return  _counter = _counter - 20;
      }
      isFull = _counter == 160 ? isFull = !isFull : isFull;
      _counter = _counter + 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          height: 50,
          width: 100,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Image.asset('assets/SAUDOMETRO.png'),
              Positioned(
                bottom: 0,
                //right: 10,
                //right: 10,
                child: Transform.rotate(
                  angle: _counter * -pi / 180,
                  //transform: Matrix4.rotationZ(_counter * -pi / 180),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Image.asset(
                      'assets/SAUDOMETRO_POINTER.png',
                      width: 40,
                      height: 8,
                    ),
                  ),
                  origin: Offset(-22.5, 0),
                ),
              ),
            ],
          ),
        ),
      ),

      /*Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              //style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
