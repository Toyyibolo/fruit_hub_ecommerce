import 'dart:math';

import 'package:flutter/material.dart';

class Styles {
  static Color orangeColor = const Color(0xffffA451);
  static Color textColor1 = const Color(0xff27214D);
  static Color textColor2 = const Color(0xff5d577e);
  static Color whiteColor = Colors.white;
}

class ScaleSize {
  static double textScaleFctor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 812) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
