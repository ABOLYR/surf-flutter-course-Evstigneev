import 'package:flutter/material.dart';

class AddSightScreenAppBar extends StatelessWidget implements PreferredSizeWidget{
  final VoidCallback onBackButtonPressed;
  final double height;
  final Widget title;
  final Widget backButton;

  const AddSightScreenAppBar({
    @required this.height,
    this.title = const Text(''),
    this.backButton = const Text(''),
    this.onBackButtonPressed,
    Key key}) : super(key: key);

  @override
  Size get preferredSize => new Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Stack(
        alignment: AlignmentDirectional.center,
        children:[
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () => onBackButtonPressed(),
              child: backButton,
            ),
          ),
          title,
        ]
      ),
    );
  }
}