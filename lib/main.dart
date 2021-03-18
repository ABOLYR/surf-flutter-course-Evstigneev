import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyFirstWidgetFul(),
      //home: MyFirstWidgetLess(),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyFirstWidgetLess extends StatelessWidget {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    count+= 1;
    print(count);
    return Container(
      child: Center(
        child: Text("Hello!"),
      ),
    );
  }
}

class MyFirstWidgetFul extends StatefulWidget {
  @override
  _MyFirstWidgetFulState createState() => _MyFirstWidgetFulState();
}

class _MyFirstWidgetFulState extends State<MyFirstWidgetFul> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    count+= 1;
    print(count);
    return Container(
      child: Center(
        child: Text("Hello!"),
      ),
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
