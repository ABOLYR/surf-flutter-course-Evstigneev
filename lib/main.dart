import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/filtersScreen.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/screen/settings_screen.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';
import 'package:places/ui/res/themes.dart';

void main() {
  runApp(App());
}


class App extends StatefulWidget {

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool isDarkTheme = false;

  @override
  void initState() {
    changeNotifier.addListener(() {
      setState(() {
        isDarkTheme = !isDarkTheme;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'title',
      theme: (isDarkTheme) ? darkTheme : lightTheme,
      home:
        //SightDetails(mocks[1]),
        //SightListScreen(),
        //MyHomePage(),
        //FiltersScreen(),
        SettingsScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VisitingScreen();
}



