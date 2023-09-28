import "package:flutter/material.dart";
import 'package:fruit_hub/customWidget/custom_container.dart';
import 'package:fruit_hub/screens/authentication_page.dart';
import 'package:fruit_hub/utils/responsive_helper.dart';
import 'package:fruit_hub/utils/styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fruit_hub/utils/constant.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    double wRatio = ApplyLayout.swr(context, 375);
    double hRatio = ApplyLayout.shr(context, 812);
    double ws = ApplyLayout.gw(context);
    double hs = ApplyLayout.gh(context);
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Container(
            width: ApplyLayout.gw(context),
            decoration: const BoxDecoration(color: Colors.orange),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 35 * wRatio,
                    top: 155 * hRatio,
                    right: 35 * wRatio,
                    bottom: 25 * hRatio),
                child: Column(
                  children: [
                    Image.asset(
                        'assets/imgbin-basket-of-fruit-cartoon-fruits-basket-still-life-illustration-zT8c0qVNxL2hbA3BBdz73AmJr-removebg-preview (1) 1.png'),
                    const SizedBox(height: 10),
                    Image.asset('assets/Ellipse 1 (1).png'),
                  ],
                ),
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 56 * hRatio, left: 24 * wRatio, right: 24 * wRatio),
            child: Column(
              children: [
                Text(
                  'Get The Freshest Fruit Salad Combo',
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  textScaleFactor: ScaleSize.textScaleFctor(context),
                ),
                SizedBox(height: 20 * hRatio),
                const AutoSizeText(
                  'We deliver the best and freshest fruit salad in\ntown. Order for a combo today!!!',
                  style: TextStyle(fontSize: 15),
                  maxLines: 2,
                ),
                SizedBox(height: 35 * hRatio),
                Builder(builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      goTo(context, const AuthenticationPage());
                    },
                    child: Button(
                      ws: ws,
                      hr: hRatio,
                      text: "Let's Continue",
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
