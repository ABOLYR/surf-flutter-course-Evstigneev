import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/components/add_sight/appbar.dart';
import 'package:places/ui/components/add_sight/list_view.dart';
import 'package:places/ui/components/main_action_button.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_content.dart';

class AddSightScreen extends StatefulWidget {
  const AddSightScreen({Key key}) : super(key: key);

  @override
  _AddSightScreenState createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State<AddSightScreen> {
  bool isActive = false;
  Sight sight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AddSightScreenAppBar(
        height: AppBar().preferredSize.height,
        title: Text(TextContent.addScreenTitle[0],
          style: Theme.of(context).textTheme.headline5,
        ),
        backButton: Text(TextContent.addScreenButton[0],
          style: Theme.of(context).textTheme.headline3.copyWith(color: grey),
        ),
        onBackButtonPressed: () => Navigator.of(context).pop(),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 24),
        child: Stack(
          children: [
            AddSightListView(mapCallback: (map) {
              if (map.isNotEmpty) {
                setState(() {
                  isActive = true;
                  sight = Sight(
                      map['name'],
                      double.parse(map['lat']),
                      double.parse(map['lon']),
                      (map['url'] == null) ? 'https://upload.wikimedia.org/wikipedia/commons/7/75/No_image_available.png' : map['url'],
                      map['details'],
                      map['type'],
                      (map['meta'] == null) ? {'type': 'unknown', 'id': (mocks.length + 1).toString()} : map['meta']
                  );
                });
              }else{
                setState(() {
                  isActive = false;
                });
              }
            }),
            MainActionButton(
              isActive: isActive,
              onPressed: () {
                mocks.add(sight);
                Navigator.of(context).pop();
              },
              content: Text(TextContent.addScreenButton[2]),
            ),
          ],
        ),
      ),
    );
  }
}
