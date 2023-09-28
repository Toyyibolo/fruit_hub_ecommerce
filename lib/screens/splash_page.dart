import "package:flutter/material.dart";
import 'package:fruit_hub/screens/welcome_page.dart';
import 'package:fruit_hub/utils/constant.dart';
import 'package:fruit_hub/utils/styles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5))
        .then((value) => moveTo(context, WelcomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.whiteColor,
      body: Center(
        child: Image.asset('assets/Group 60.png'),
      ),
    );
  }
}
