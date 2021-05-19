import 'dart:math';

import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';

class NearbySights {

  bool _arePointsNear(
      Map<String, double> checkPoint,
      Map<String, double> locationPoint,
      Map<String, double> radius) {
    double ky = 40008.55 / 360;
    double kx = cos(pi * locationPoint['lat'] / 180.0) * ky;
    double dx = (locationPoint['lon'] - checkPoint['lon']).abs() * kx;
    double dy = (locationPoint['lat'] - checkPoint['lat']).abs() * ky;
    return sqrt(dx * dx + dy * dy) <= radius['max'] && sqrt(dx * dx + dy * dy) >= radius['min'];
  }

  List<Sight> sightsList(
      Map<String, double> locationPoint,
      Map<String, double> radius) {
    List<Sight> matches = [];
    int i = 0;
    while(i < mocks.length)  {
      Sight sight = mocks[i];
      Map<String, double> checkPoint = {
        "lon": sight.lon,
        "lat": sight.lat,
      };
      if (_arePointsNear(checkPoint, locationPoint, radius)) {
        matches.add(sight);
      }
      i++;
    }
    return matches;
  }
}