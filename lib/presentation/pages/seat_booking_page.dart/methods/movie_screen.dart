import 'package:flutter/material.dart';
import 'package:flutter_flix_id/presentation/misc/constants.dart';

Widget movieScreen() => Container(
  width: 250,
  height: 50,
  margin: EdgeInsets.only(top: 24, bottom: 10),
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [saffron.withOpacity(0.33), Colors.transparent],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
  child: Align(
    alignment: Alignment.topCenter,
    child: Container(
      height: 5,
      color: saffron,
    ),
  ),
);
