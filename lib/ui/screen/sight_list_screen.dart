import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/screen/sight_card.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> { //Screen with list of sights
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        toolbarHeight: 150,
        title: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 64),
            child: Text('Список\nинтересных мест',
              style: TextStyle(
                color: purple,
                height: 36 / 32,
                fontSize: 32,
                fontFamily: 'Roboto',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
              ),
            )
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SightCard(mocks[0]),
            SightCard(mocks[1]),
            SightCard(mocks[2]),
          ],
        ),
      ),
    );
  }
}
