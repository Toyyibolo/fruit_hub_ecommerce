import 'package:flutter/material.dart';
import 'package:fruit_hub/customWidget/shortproduct_box.dart';
import 'package:fruit_hub/utils/responsive_helper.dart';

class HottestPage extends StatelessWidget {
  HottestPage({super.key});

  List<Color> colorsList = [
    Color(0xfffffaeb),
    Color(0xfffef0f0),
    Color(0xfff1eff6),
  ];

  @override
  Widget build(BuildContext context) {
    double hRatio = ApplyLayout.shr(context, 812);
    double wRatio = ApplyLayout.swr(context, 375);
    return SizedBox(
        height: 180 * hRatio,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            ShortProduct(
              boxColor: colorsList[0],
            ),
            ShortProduct(
              boxColor: colorsList[1],
            ),
            ShortProduct(
              boxColor: colorsList[2],
            ),
          ],
        ));
  }
}

class PopularPage extends StatelessWidget {
  const PopularPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class NewComboPage extends StatelessWidget {
  const NewComboPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
