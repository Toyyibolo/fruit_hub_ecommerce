import 'package:flutter/material.dart';

class ApplyLayout {
  static double gh(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double gw(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double shr(BuildContext context, double dH) {
    var shratio = gh(context) / dH;
    return shratio;
  }

  static double swr(BuildContext context, double dW) {
    var swratio = gw(context) / dW;
    return swratio;
  }
}
