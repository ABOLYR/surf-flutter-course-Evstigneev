import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/style.dart';

class FilterCategoryIcon extends StatelessWidget {
  final String title;
  final String type;
  final bool checked;

  const FilterCategoryIcon(this.title, this.type, this.checked, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: 64,
            height: 64,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      color: filterScreenLightColor.withOpacity(0.16),
                      child: Center(
                          child: Image.asset('res/icons/filters/${type}Icon.png')
                      ),
                    ),
                  ),
                ),
                (checked)
                    ? Image.asset('res/icons/filters/checked.png')
                    : Container()
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(title,
            style: headline1TextStyle.copyWith(color: darkPurple),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
