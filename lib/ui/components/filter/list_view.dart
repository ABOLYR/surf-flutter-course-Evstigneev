import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/components/filter/categories.dart';
import 'package:places/ui/components/filter/distance_slider.dart';
import 'package:places/ui/res/style.dart';
import 'package:places/ui/res/text_content.dart';

class FiltersScreenListView extends StatelessWidget {
  final IntCallback onTap;
  final ValueChanged<List<Sight>> onChangeEnd;
  final List<bool> checked;
  final List<String> type;
  final List<String> typeName;

  const FiltersScreenListView({
    @required this.onTap,
    @required this.onChangeEnd,
    @required this.checked,
    @required this.typeName,
    @required this.type,
    Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Text(TextContent.filtersTitle[0],
              style: headline1TextStyle,
            ),
          ),
          FiltersScreenCategories(
            checked: checked,
            type: type,
            typeName: typeName,
            onTap: (index) => onTap(index),
          ),
          Padding(
              padding: EdgeInsets.only(top: 56),
              child: DistanceSlider(
                onChangeEnd: (matches) => onChangeEnd(matches),
              )
          ),
        ],
      ),
    );
  }
}
