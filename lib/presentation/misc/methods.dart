import 'package:flutter/widgets.dart';

Map<double, SizedBox> _verticalSpaces = {};
Map<double, SizedBox> _horizontalSpaces = {};

SizedBox verticalSpaces(double height) {
  if (!_verticalSpaces.containsKey(height)) {
    _verticalSpaces [height] = SizedBox(height: height);
  }

  return _verticalSpaces[height]!;
}

SizedBox horizontalSpaces(double width) {
  if (!_horizontalSpaces.containsKey(width)) {
    _horizontalSpaces [width] = SizedBox(width: width);
  }

  return _horizontalSpaces[width]!;
}