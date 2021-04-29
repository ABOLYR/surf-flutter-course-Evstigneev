import 'package:flutter/material.dart';

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
        color: (selected) ? Theme.of(context).selectedRowColor : Theme.of(context).unselectedWidgetColor,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: (selected) ? Theme.of(context).unselectedWidgetColor : Theme.of(context).selectedRowColor,
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
