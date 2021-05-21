

import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_content.dart';
import 'package:places/ui/components/bottom_navigation_bar.dart';
import 'package:places/ui/res/themes.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextContent.appBarTitle[1]), //Настройки
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.headline5,
        elevation: 0,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(TextContent.settingTitle[0], style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.w400),),  //Темная тема
            trailing: Switch(
                value: darkTheme,
                onChanged: (newValue) {
                  changeNotifier.notifyListeners();
                  setState(() {
                    darkTheme = newValue;
                  });
                }
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(),
          ),
          ListTile(
            title: Text(TextContent.settingTitle[1], style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.w400),), //Смотреть туториал
            trailing: Icon(Icons.info_outline, color: filterScreenLightColor,)
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
