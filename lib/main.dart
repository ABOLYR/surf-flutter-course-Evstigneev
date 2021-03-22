import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

void main() {
  runApp(App());
}


class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: SightListScreen(),
    );
  }
}

class MyFirstWidgetLess extends StatelessWidget {
  int count = 0;
  // Type getContextType() {
  //   return context.runtimeType;
  // }
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
  Type getContextType() {
    return context.runtimeType;
  }
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


