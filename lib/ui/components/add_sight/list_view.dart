import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/components/add_sight/form.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_content.dart';
import 'package:places/ui/screen/add_sight/category.dart';

typedef MapCallback = Function(Map<String, String> list);

class AddSightListView extends StatefulWidget {
  final MapCallback mapCallback;

  const AddSightListView({this.mapCallback, Key key}) : super(key: key);

  @override
  _AddSightListViewState createState() => _AddSightListViewState();
}

class _AddSightListViewState extends State<AddSightListView> {
  String category = '';
  TextEditingController categoryController = TextEditingController();
  final Map<String, String> sight = {
    'name': '',
    'type': '',
    'lat': '',
    'lon': '',
    'details': '',
  };

  bool get canSave =>
      sight['type'] != ''
      && sight['name'] != ''
      && sight['lat'] != ''
      && sight['lon'] != ''
      && sight['details'] != '';

  void areAllFieldsFilled() {
      widget.mapCallback((canSave) ? sight : {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          child: Text(TextContent.addScreenTitle[1],
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        // Category
        InkWell(
          onTap: () async {
            category = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddScreenCategoryScreen()),);
            categoryController.text = category;
            sight.addAll({"type": category});
            areAllFieldsFilled();
          },
          child: Container(
            height: 40,
            child: TextField(
              enabled: false,
              controller: categoryController,
              style: Theme.of(context).textTheme.headline3,
              decoration: InputDecoration(
                hintText: TextContent.addScreenHint[0],
                suffixIcon: Icon(Icons.arrow_forward_ios, color: visitingScreenSelectedColor,),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: grey.withOpacity(0.56),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: grey.withOpacity(0.56),
                    ),
                ),
              ),
            ),
          ),
        ),
        // Name
        Padding(
            padding: EdgeInsets.only(top: 24),
            child: AddSightForm(
                title: TextContent.addScreenTitle[2],
                stringCallback: (value) {
                  sight.addAll({"name": value});
                  areAllFieldsFilled();
                })
        ),
        // Latitude / Longitude
        Padding(
          padding: EdgeInsets.only(top: 24),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: AddSightForm(
                    title: TextContent.addScreenTitle[3],
                    keyboardType: TextInputType.number,
                    stringCallback: (value) {
                      sight.addAll({"lat": value});
                      areAllFieldsFilled();
                    }),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: AddSightForm(
                    title: TextContent.addScreenTitle[4],
                    keyboardType: TextInputType.number,
                    stringCallback: (value) {
                      sight.addAll({"lon": value});
                      areAllFieldsFilled();
                    }),
                ),
              ),
            ],
          ),
        ),
        Align( // Map button
          alignment: Alignment.centerLeft,
          child: TextButton(
              focusNode: FocusNode(skipTraversal: true),
              onPressed: () => print('Map'),
              child: Text(TextContent.addScreenButton[1], style: Theme.of(context).textTheme.headline2.copyWith(color: green),),
          ),
        ),
        // Description
        Padding(
          padding: EdgeInsets.only(top: 37),
          child: AddSightForm(
            title: TextContent.addScreenTitle[5],
            hintText: TextContent.addScreenHint[1],
            maxLines: 4,
            height: 80,
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            stringCallback: (value) {
              sight.addAll({"details": value});
              areAllFieldsFilled();
            }
          ),
        )
      ],
    );
  }
}
