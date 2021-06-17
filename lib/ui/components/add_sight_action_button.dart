import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_content.dart';

class AddSightActionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddSightActionButton({
    @required this.onPressed,
    Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) { //Large button at the bottom
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              )),
              padding: MaterialStateProperty.all(EdgeInsets.zero),
          ),
          onPressed: () {
              onPressed();
          },
          child: Container(
            width: 177,
            height: 48,
            child: Ink(
              decoration: ShapeDecoration(
              shape: StadiumBorder(),
              gradient: LinearGradient(colors: [
              Color(0xFFFCDD3D),
              Color(0xFF4CAF50),
              ])
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: white,),
                  SizedBox(width: 14,),
                  Text(TextContent.sightListScreenButton[0].toUpperCase(), style: Theme.of(context).textTheme.subtitle1.copyWith(color: white))
                ],
              )
            ),
          )
        ),
      ),
    );
  }
}