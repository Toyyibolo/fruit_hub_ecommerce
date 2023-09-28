// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fruit_hub/screens/single_product.dart';
import 'package:fruit_hub/utils/constant.dart';
import 'package:fruit_hub/utils/responsive_helper.dart';

class ProductBox extends ConsumerWidget {
  String imageUrl;
  String productName;
  String price;
  bool liked;
  Function onTapLiked;
  ProductBox(
      {required this.imageUrl,
      required this.productName,
      required this.price,
      required this.liked,
      required this.onTapLiked});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double hRatio = ApplyLayout.shr(context, 812);
    double wRatio = ApplyLayout.swr(context, 375);

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Card(
        elevation: 2,
        child: Container(
          height: 183 * hRatio,
          width: 152 * wRatio,
          decoration: const BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Positioned(
                  top: 5 * hRatio,
                  right: 5 * wRatio,
                  child: GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.favorite_border,
                          color: Colors.orange))),
              Positioned(
                  top: 20 * hRatio,
                  right: 25 * wRatio,
                  child: Image.asset(
                    imageUrl,
                    height: 95 * hRatio,
                  )),
              Positioned(
                  bottom: 40 * hRatio,
                  left: 15 * wRatio,
                  child: Text(productName)),
              Positioned(
                  bottom: 15 * hRatio,
                  left: 15 * wRatio,
                  child: Text("N $price")),
              Positioned(
                  bottom: 13 * hRatio,
                  right: 15 * wRatio,
                  child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.orange[200]),
                        child: const Icon(
                          Icons.add,
                          color: Colors.orange,
                          size: 19,
                        )),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
