import 'package:flutter/material.dart';
import 'package:places/ui/components/filter/filter_type_icon.dart';

typedef IntCallback = Function(int num);

class FiltersScreenCategories extends StatelessWidget {
  final IntCallback onTap;
  final List<String> type;
  final List<String> typeName;
  final List<bool> checked;

  const FiltersScreenCategories({
    @required this.onTap,
    @required this.type,
    @required this.typeName,
    @required this.checked,
    Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      padding: EdgeInsets.symmetric(horizontal: 40.5),
      child: GridView.builder(
        itemCount: type.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (BuildContext context, index) {
          return InkWell(
              onTap: () => onTap(index),
              child: FilterCategoryIcon( typeName[index], type[index], checked[index])
          );
        },
      ),
    );
  }
}
