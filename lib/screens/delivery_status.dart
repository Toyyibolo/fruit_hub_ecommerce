// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:flutter/material.dart";
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_hub/customWidget/custom_container.dart';
import 'package:fruit_hub/providers.dart';
import 'package:fruit_hub/screens/order_complete.dart';
import 'package:fruit_hub/utils/basket_product.dart';
import 'package:fruit_hub/utils/constant.dart';
import 'package:fruit_hub/utils/product_info.dart';
import 'package:fruit_hub/utils/responsive_helper.dart';
import 'package:fruit_hub/utils/timeline.dart';
import 'package:fruit_hub/utils/trackingBox.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class DeliveryStatus extends ConsumerStatefulWidget {
  @override
  ConsumerState<DeliveryStatus> createState() => _DeliveryStatusState();
}

class _DeliveryStatusState extends ConsumerState<DeliveryStatus> {
  @override
  Widget build(BuildContext context) {
    double hRatio = ApplyLayout.shr(context, 812);
    double wRatio = ApplyLayout.swr(context, 375);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 150 * hRatio,
            width: double.maxFinite,
            color: Colors.orange,
            child: Padding(
              padding: EdgeInsets.only(left: 15.0 * wRatio, top: 50 * hRatio),
              child: Row(
                children: [
                  GoBackButton(),
                  SizedBox(width: 60 * hRatio),
                  Text(
                    'Delivery Status',
                    style: textStyle2(wRatio, Colors.white),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 30, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TimeLineWidget(
                  status: 'Order Taken',
                  imageUrl: 'assets/note_5930624.png',
                  color: Color.fromARGB(255, 206, 182, 113),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24 * wRatio),
                  child: const RotatedBox(
                    quarterTurns: 1,
                    child: Text(
                      '.........',
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
                TimeLineWidget(
                  status: 'Order Is Being Prepared',
                  imageUrl:
                      'assets/3d-render-illustration-icon-exam-report_337293-406.jpg',
                  color: Color(0xfffef0f0),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24 * wRatio),
                  child: const RotatedBox(
                    quarterTurns: 1,
                    child: Text('.........',
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ),
                ),
                //           Color(0xfffffaeb),
                // Color(0xfffef0f0),
                // Color(0xfff1eff6),

                TimeLineWidget2(
                  status: 'Order Is Being Delivered',
                  status2: 'Your delivery agent is coming',
                  imageUrl: 'assets/Delivery-Scooter-PNG-Cutout.png',
                  color: Color(0xfff1eff6),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24 * wRatio),
                  child: const RotatedBox(
                    quarterTurns: 1,
                    child: Text('.......',
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Container(
                      height: 150 * hRatio,
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        color: Colors.blue,
                      ),
                      child: FlutterMap(
                        options: MapOptions(
                          center: LatLng(6.465422, 3.406448),
                          zoom: 9.2,
                        ),
                        nonRotatedChildren: [
                          AttributionWidget.defaultWidget(
                              source: "openStreetMap contributors",
                              onSourceTapped: null),
                        ],
                        layers: [
                          TileLayerOptions(
                              urlTemplate:
                                  ("https://tile.openstreetmap.org/{z}/{x}/{y}.png")),
                          MarkerLayerOptions(markers: [
                            Marker(
                                point: LatLng(6.5915985, 3.3579913),
                                builder: (context) => Icon(Icons.pin_drop))
                          ])
                        ],
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24 * wRatio),
                  child: const RotatedBox(
                    quarterTurns: 1,
                    child: Text('........',
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 35,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('Order Recieved',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ]),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
