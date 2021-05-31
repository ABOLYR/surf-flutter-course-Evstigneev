import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        print('Switch to tab $index');
      },
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Theme.of(context).selectedRowColor,
      currentIndex: 2,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.square_list,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.heart_fill),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '',
        )
      ],
    );
  }
}
