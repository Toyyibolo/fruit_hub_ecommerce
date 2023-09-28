// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:fruit_hub/utils/constant.dart';
import 'package:fruit_hub/utils/responsive_helper.dart';

class BasketContainer extends StatelessWidget {
  String productName;
  String quantity;
  String price;
  String url;
  BasketContainer({
    Key? key,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double hRatio = ApplyLayout.shr(context, 812);
    double wRatio = ApplyLayout.swr(context, 375);
    return Container(
      height: 135 * hRatio,
      width: double.maxFinite,
      child: Padding(
        padding: EdgeInsets.only(
            top: 0.0 * hRatio,
            left: 20 * wRatio,
            right: 20 * wRatio,
            bottom: 0 * hRatio),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    color: Color.fromRGBO(255, 235, 59, 1),
                  ),
                  child: Center(
                    child: Image.asset(
                      url,
                      height: 60,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20 * wRatio,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 140,
                        child: AutoSizeText(
                          productName,
                          style: textStyle1(wRatio, Colors.blue),
                        ),
                      ),
                      SizedBox(height: 10),
                      AutoSizeText(
                        quantity,
                        style: textStyle1(wRatio, Colors.blue),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20 * wRatio),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AutoSizeText('N $price'),
                    ],
                  ),
                )
              ],
            ),
            Divider(thickness: 0.2, color: Colors.grey)
          ],
        ),
      ),
    );
  }
}
