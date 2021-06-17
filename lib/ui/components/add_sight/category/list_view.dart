import 'package:flutter/material.dart';
import 'package:places/ui/components/add_sight/category/list_tile.dart';
import 'package:places/ui/res/text_content.dart';

typedef IntCallback = Function(int index);

class AddSightCategoryListView extends StatefulWidget {
  final IntCallback intCallback;

  const AddSightCategoryListView({this.intCallback, Key key}) : super(key: key);

  @override
  _AddSightCategoryListViewState createState() => _AddSightCategoryListViewState();
}

class _AddSightCategoryListViewState extends State<AddSightCategoryListView> {
  int selectedTileIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: TextContent.addScreenCategoryList.length,
        itemBuilder: (buildContext, index) {
          return AddScreenCategoryListTile(
            index: index,
            voidCallback: () {
              setState(() {
                selectedTileIndex = index;
              });
                widget.intCallback(index);
            },
            selected: (selectedTileIndex == index) ? true : false,
          );
        },
    );
  }
}
