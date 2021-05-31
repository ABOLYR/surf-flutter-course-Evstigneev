import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/services/nearby_sights.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/style.dart';

class DistanceSlider extends StatefulWidget {
  final ValueChanged<List<Sight>> onChangeEnd;

  const DistanceSlider({Key key, this.onChangeEnd}) : super(key: key);

  @override
  _DistanceSliderState createState() => _DistanceSliderState();
}

class _DistanceSliderState extends State<DistanceSlider> {
  RangeValues values = RangeValues(0.1, 10.0);
  Map<String, double> locationPoint = {
    'lat': 40.4383117433301,
    'lon': 116.57859470410664,
  };
  Map<String, double> radius = {};
  List<Sight> matchedNames;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 72,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    child: Text("Расстояние",
                      style: headline2TextStyle.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child: Text("от ${double.parse((values.start).toStringAsFixed(1))} до ${double.parse((values.end).toStringAsFixed(1))} км",
                        style: headline2TextStyle.copyWith(fontWeight: FontWeight.w400, color: grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 24),
            child: Container(
              height: 16,
              child: RangeSlider(
                min: 0.1,
                max: 10.0,
                onChanged: (newValues) {
                  setState(() {
                    values = newValues;
                  });
                },
                onChangeEnd: (newValues) {
                  radius = {
                    "min": double.parse((newValues.start).toStringAsFixed(1)),
                    "max": double.parse((newValues.end).toStringAsFixed(1))
                  };
                  matchedNames = NearbySights().sightsList(locationPoint, radius);
                  widget.onChangeEnd(matchedNames);
                },
                values: values,
              ),
            ),
          )
        ],
      ),
    );
  }
}
