import 'package:flutter/material.dart';

Widget sightImagePreloader(context, child, loadingProgress) {
  if (loadingProgress == null) return child;

  return Center(
    child: CircularProgressIndicator(),
  );
}