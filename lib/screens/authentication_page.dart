import "package:flutter/material.dart";
import 'package:fruit_hub/customWidget/custom_container.dart';
import 'package:fruit_hub/screens/homeScreen.dart';
import 'package:fruit_hub/screens/welcome_page.dart';
import 'package:fruit_hub/utils/constant.dart';
import 'package:fruit_hub/utils/responsive_helper.dart';
import 'package:fruit_hub/utils/styles.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    double wRatio = ApplyLayout.swr(context, 375);
    double hRatio = ApplyLayout.shr(context, 812);
    double ws = ApplyLayout.gw(context);
    double hs = ApplyLayout.gh(context);
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: ApplyLayout.gw(context),
              decoration: const BoxDecoration(color: Colors.orange),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 35 * wRatio,
                      top: 130 * hRatio,
                      right: 35 * wRatio,
                      bottom: 25 * hRatio),
                  child: Column(
                    children: [
                      Image.asset(
                          'assets/kisspng-fruit-basket-clip-art-5aed5301d44408 1.png'),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What is your firstname?',
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                    textScaleFactor: ScaleSize.textScaleFctor(context),
                  ),
                  SizedBox(height: 20 * hRatio),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.white)),
                        fillColor: Colors.grey[250],
                        hintText: 'Tony',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        filled: true),
                  ),
                  SizedBox(height: 40 * hRatio),
                  GestureDetector(
                    onTap: () {
                      moveTo(context, const HomeScreen());
                    },
                    child: Button(
                      ws: ws,
                      hr: hRatio,
                      text: "Start Ordering",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
