import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_content.dart';

class AddScreenCategoryListTile extends StatelessWidget {
  final VoidCallback voidCallback;
  final int index;
  final bool selected;

  const AddScreenCategoryListTile({this.index, this.voidCallback, this.selected, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(TextContent.addScreenCategoryList[index], style: Theme.of(context).textTheme.headline3,),
          trailing: Visibility(
              visible: selected,
              child: Icon(Icons.check, color: green,)
          ),
          onTap: () {
            voidCallback();
          },
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(height: 0.8, color: grey.withOpacity(0.56),)
        )
      ],
    );
  }
}

