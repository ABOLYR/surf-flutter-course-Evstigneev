import 'package:flutter/material.dart';
import 'package:places/ui/res/text_content.dart';

class SightCardAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _SightCardAppBarState createState() => _SightCardAppBarState();

  @override
  Size get preferredSize {
    return Size(double.infinity, 128);  }
}

class _SightCardAppBarState extends State<SightCardAppBar> { //Custom Appbar for sight list screen
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 60,
        bottom: 16,
        left: 16,
        right: 16,
      ),
      child: Text(
        TextContent.appBarTitle[0], //Список\nинтересных мест
        textAlign: TextAlign.start,
        maxLines: 2,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
