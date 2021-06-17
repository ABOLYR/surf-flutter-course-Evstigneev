import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/ui/res/colors.dart';

typedef StringCallback = Function(String value);

class AddSightTextField extends StatefulWidget {
  final StringCallback stringCallback;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String hintText;
  final int maxLines;

  const AddSightTextField({
    this.stringCallback,
    this.hintText = '',
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    Key key}) : super(key: key);

  @override
  _AddSightTextFieldState createState() => _AddSightTextFieldState();
}

class _AddSightTextFieldState extends State<AddSightTextField> {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(_onFocusChange);
    super.initState();
  }

  _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      style: Theme.of(context).textTheme.headline3,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.headline3.copyWith(color: grey.withOpacity(0.56)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          suffixIcon: Visibility(
            visible: _focusNode.hasFocus,
            child: IconButton(
              focusNode: FocusNode(
                skipTraversal: true,
              ),
              icon: Icon(CupertinoIcons.clear_circled, color: grey,),
              onPressed: () {
                _controller.clear();
                widget.stringCallback(_controller.value.text);
              }
            ),
          ),
      ),
      onChanged: (value) => widget.stringCallback(_controller.value.text),
    );
  }
}
