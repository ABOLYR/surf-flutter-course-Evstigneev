import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';

class TabBarIndicator extends StatelessWidget {
  final TabController tabController;
  final bool selected;
  final String label;

  TabBarIndicator(this.tabController, {this.selected = false, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 164,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: (selected) ? selectedTabColor : whiteSmoke,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: (selected) ? white : grey,
            height: 18 / 14,
            fontSize: 14,
            fontFamily: 'Roboto',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
