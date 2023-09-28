import 'package:flutter/material.dart';
import 'package:fruit_hub/utils/responsive_helper.dart';

class ShortProduct extends StatelessWidget {
  Color boxColor;
  ShortProduct({super.key, required this.boxColor});

  @override
  Widget build(BuildContext context) {
    double hRatio = ApplyLayout.shr(context, 812);
    double wRatio = ApplyLayout.swr(context, 375);
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Card(
        color: boxColor,
        elevation: 2,
        child: Container(
          height: 150 * hRatio,
          width: 140 * wRatio,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            //color: boxColor,
          ),
          child: Stack(
            children: [
              Positioned(
                  top: 4 * hRatio,
                  right: 4 * wRatio,
                  child:
                      const Icon(Icons.favorite_border, color: Colors.orange)),
              Positioned(
                  top: 20 * hRatio,
                  right: 25 * wRatio,
                  child: Image.asset(
                    'assets/breakfast-quinoa-and-red-fruit-salad-134061-1-removebg-preview 2.png',
                    height: 80 * hRatio,
                  )),
              Positioned(
                  bottom: 40 * hRatio,
                  left: 15 * wRatio,
                  child: const Text('Quinoa fruit salad')),
              Positioned(
                  bottom: 15 * hRatio,
                  left: 15 * wRatio,
                  child: const Text('N 2,000')),
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
