import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';

class MainActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget content;
  final Color color;
  final bool isActive;

  const MainActionButton({
    @required this.onPressed,
    this.content = const Text(''),
    this.color = filterScreenLightColor,
    this.isActive = true,
    Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) { //Large button at the bottom
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: SizedBox(
          width: 328,
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: (isActive) ? this.color : whiteSmoke,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                )
            ),
            onPressed: () {
              if (isActive) {
                onPressed();
              }
            },
            child: this.content,
          ),
        ),
      ),
    );
  }
}