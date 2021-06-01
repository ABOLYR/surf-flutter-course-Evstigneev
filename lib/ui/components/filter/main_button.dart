import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_content.dart';

class FiltersScreenMainButton extends StatelessWidget {
  final VoidCallback onPressed;
  final List<Sight> selectedSights;
  const FiltersScreenMainButton({@required this.onPressed, this.selectedSights, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) { //Large button at the bottom
    return SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: SizedBox(
              width: 328,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: filterScreenLightColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    )
                ),
                onPressed: () => onPressed(),
                child: Text('${TextContent.filtersButtons[1]} (${selectedSights.length})'),
              ),
            ),
          ),
        )
    );
  }
}
