import 'package:flutter/material.dart';
import 'package:places/ui/components/add_sight/appbar.dart';
import 'package:places/ui/components/add_sight/category/list_view.dart';
import 'package:places/ui/components/main_action_button.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_content.dart';

class AddScreenCategoryScreen extends StatefulWidget {
  const AddScreenCategoryScreen({Key key}) : super(key: key);

  @override
  _AddScreenCategoryScreenState createState() => _AddScreenCategoryScreenState();
}

class _AddScreenCategoryScreenState extends State<AddScreenCategoryScreen> {
  String selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AddSightScreenAppBar(
        height: AppBar().preferredSize.height,
        title: Text(TextContent.addScreenCategoryTitle[0],
          style: Theme.of(context).textTheme.headline5,
        ),
        backButton: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios, color: visitingScreenSelectedColor,),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 24),
        child: Stack(
          children: [
            AddSightCategoryListView(
              intCallback: (selectedIndex) {
                setState(() {
                  selectedCategory = TextContent.addScreenCategoryList[selectedIndex];
                });
              }
            ),
            MainActionButton(
              isActive: !(selectedCategory == ''),
              onPressed: () => Navigator.pop(context, selectedCategory),
              content: Text(TextContent.addScreenCategoryButton[0].toUpperCase(),
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: !(selectedCategory == '') ? white : grey.withOpacity(0.56),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
