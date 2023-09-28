import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  double ws;
  double hr;
  String text;
  Button({
    super.key,
    required this.ws,
    required this.hr,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56 * hr,
      width: ws,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.orange),
      child: Center(
        child: AutoSizeText(
          text,
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }
}

class OutlineButton extends StatelessWidget {
  double ws;
  double hr;
  String text;
  OutlineButton({
    super.key,
    required this.ws,
    required this.hr,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56 * hr,
      width: ws,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.orange, width: 1),
      ),
      child: Center(
        child: AutoSizeText(
          text,
          style: TextStyle(fontSize: 15, color: Colors.orange),
        ),
      ),
    );
  }
}
