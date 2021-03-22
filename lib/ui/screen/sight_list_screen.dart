import 'package:flutter/material.dart';
import 'package:places/TextHeaders.dart';
import 'package:places/style/Colors.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PlacesColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: PlacesColors.backgroundColor,
        elevation: 0,
        title: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 64),
            child: Text(TextHeaders.appBarTitle,
              style: TextStyle(
                color: Colors.black,
                height: 36 / 32,
                fontSize: 32,
                fontFamily: 'Roboto',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
              maxLines: 2,
            )
        ),
        toolbarHeight: 150,
      ),
    );
  }
}
