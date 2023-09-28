import 'package:auto_size_text/auto_size_text.dart';
import "package:flutter/material.dart";
import 'package:fruit_hub/customWidget/custom_container.dart';
import 'package:fruit_hub/screens/delivery_status.dart';
import 'package:fruit_hub/utils/constant.dart';
import 'package:fruit_hub/utils/responsive_helper.dart';

class OrderComplete extends StatelessWidget {
  const OrderComplete({super.key});

  @override
  Widget build(BuildContext context) {
    double hRatio = ApplyLayout.shr(context, 812);
    double wRatio = ApplyLayout.swr(context, 375);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 40.0 * wRatio),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 160 * hRatio,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10 * wRatio),
              child: Image.asset("assets/congrat.png"),
            ),
            SizedBox(height: 40 * hRatio),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                "Congratulations!!!",
                style: textStyle3(wRatio, Colors.blue),
              ),
            ),
            SizedBox(height: 20 * hRatio),
            AutoSizeText(
              "Your order have been taken and \n         is beign attended to ",
              style: textStyle2(wRatio, Colors.blue),
            ),
            SizedBox(height: 40 * hRatio),
            GestureDetector(
                onTap: () {
                  goTo(context, DeliveryStatus());
                },
                child: Button(ws: 133, hr: hRatio, text: "Track order")),
            SizedBox(height: 50 * hRatio),
            OutlineButton(ws: 160, hr: hRatio, text: "Continue shopping"),
          ],
        ),
      ),
    );
  }
}
