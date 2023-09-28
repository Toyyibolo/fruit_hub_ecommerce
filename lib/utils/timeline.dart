// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:flutter/material.dart";
import 'package:timeline_tile/timeline_tile.dart';

import 'package:fruit_hub/utils/responsive_helper.dart';
import 'package:fruit_hub/utils/trackingBox.dart';

class TimeLineWidget extends StatelessWidget {
  String status;
  String imageUrl;
  Color color;

  TimeLineWidget({
    Key? key,
    required this.status,
    required this.imageUrl,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double hRatio = ApplyLayout.shr(context, 812);
    double wRatio = ApplyLayout.swr(context, 375);
    return Padding(
      padding: const EdgeInsets.only(right: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.,
        children: [
          Row(
            children: [
              TrackingBox(
                imageUrl: imageUrl,
                color: color,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child:
                    Text(status, style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          //SizedBox(width: 50 * wRatio),
          Icon(Icons.check_circle, color: Colors.green),
        ],
      ),
    );
  }
}

class TimeLineWidget2 extends StatelessWidget {
  String status;
  String status2;
  String imageUrl;
  Color color;

  TimeLineWidget2({
    Key? key,
    required this.status,
    required this.status2,
    required this.imageUrl,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double hRatio = ApplyLayout.shr(context, 812);
    double wRatio = ApplyLayout.swr(context, 375);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            TrackingBox(
              imageUrl: imageUrl,
              color: color,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Column(children: [
                Text(status, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(status2, style: TextStyle(fontWeight: FontWeight.bold)),
              ]),
            ),
          ],
        ),
        // SizedBox(width: 10 * wRatio),
        Container(
            width: 50,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Icon(Icons.call_outlined))
      ],
    );
  }
}
