import 'package:flutter/material.dart';
import 'package:places/ui/res/paths.dart';
import 'package:places/ui/res/style.dart';
import 'package:places/ui/res/text_content.dart';

class FiltersScreenAppBar extends StatelessWidget implements PreferredSizeWidget{
  final VoidCallback onTap;
  final double height;
  const FiltersScreenAppBar({this.onTap, @required this.height,Key key}) : super(key: key);

  @override
  Size get preferredSize => new Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: Container(
        margin: EdgeInsets.only(left: 16),
        child: InkWell(
            onTap: () {
              print('Back');
            },
            child: Image.asset(backArrow)
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 16),
          child: TextButton(
            onPressed: () => onTap(),
            child: Text(
              TextContent.filtersButtons[0],
              style: headline2TextStyle,
            ),
          ),
        )
      ],
    );
  }
}
