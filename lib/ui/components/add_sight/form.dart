import 'package:flutter/material.dart';
import 'package:places/ui/components/add_sight/text_field.dart';

typedef StringCallback = Function(String value);

class AddSightForm extends StatelessWidget {
  final StringCallback stringCallback;
  final String title;
  final String hintText;
  final int maxLines;
  final double height;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;

  const AddSightForm({
    this.stringCallback,
    @required this.title,
    this.hintText = '',
    this.maxLines = 1,
    this.height = 40,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 12),
          child: Text(title.toUpperCase(),
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        // Name
        Container(
          height: height,
          child: AddSightTextField(
            hintText: hintText,
            maxLines: maxLines,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            stringCallback: (value) => stringCallback(value),
          ),
        ),
      ],
    );
  }
}

