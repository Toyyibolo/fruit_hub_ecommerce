// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fruit_hub/utils/responsive_helper.dart';

//void main() => runApp(const MyApp());

class TrackingBox extends StatelessWidget {
  String imageUrl;
  Color color;
  TrackingBox({
    Key? key,
    required this.imageUrl,
    required this.color,
  }) : super(key: key);

  //const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double hRatio = ApplyLayout.shr(context, 812);
    double wRatio = ApplyLayout.swr(context, 375);
    return Container(
        height: 55 * hRatio,
        width: 55 * wRatio,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: color,
        ),
        child: Image.asset(imageUrl));
  }
}
