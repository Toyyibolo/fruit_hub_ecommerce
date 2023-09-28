import "package:flutter/material.dart";
import 'package:fruit_hub/customWidget/custom_container.dart';
import 'package:fruit_hub/screens/order_complete.dart';
import 'package:fruit_hub/utils/responsive_helper.dart';

goTo(BuildContext context, Widget widget) {
  return Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => widget));
}

moveTo(BuildContext context, Widget widget) {
  return Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}

TextStyle textStyle1(double wRatio, Color color) {
  return TextStyle(fontSize: 16 * wRatio, color: color);
}

TextStyle textStyle2(double wRatio, Color color) {
  return TextStyle(fontSize: 20 * wRatio, color: color);
}

TextStyle textStyle3(double wRatio, Color color) {
  return TextStyle(fontSize: 23 * wRatio, color: color);
}

class GoBackButton extends StatelessWidget {
  const GoBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    double hRatio = ApplyLayout.shr(context, 812);
    double wRatio = ApplyLayout.swr(context, 375);
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 80 * wRatio,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Row(children: [
          const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 20,
          ),
          const Text('Go back')
        ]),
      ),
    );
  }
}

bottomSheet1(
    BuildContext context, double hRatio, double wRatio, Function cardTap) {
  return showModalBottomSheet(
      isDismissible: false,
      clipBehavior: Clip.hardEdge,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Icon(
                    Icons.cancel,
                    size: 60 * hRatio,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20 * hRatio,
              ),
              Container(
                //color: Colors.white,
                //height: 350,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 20.0 * wRatio, right: 20 * wRatio),
                  child: firstPage(context, hRatio, wRatio, cardTap),
                ),
              ),
            ],
          ),
        );
      });
}

firstPage(
    BuildContext context, double hRatio, double wRatio, Function cardTap) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    SizedBox(height: 30 * hRatio),
    Text('Delivery address'),
    SizedBox(
      height: 15 * hRatio,
    ),
    TextField(
      autofocus: true,
      decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white)),
          fillColor: Colors.grey[250],
          hintText: '10th avenue, lekki , Lagos State',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          filled: true),
    ),
    SizedBox(height: 20 * hRatio),
    Text("Number we can call"),
    SizedBox(height: 15 * hRatio),
    SizedBox(
      height: 50,
      child: TextField(
        autofocus: true,
        decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white)),
            fillColor: Colors.grey[250],
            hintText: '07068957720',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            filled: true),
      ),
    ),
    SizedBox(
      height: 40 * hRatio,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlineButton(ws: 125, hr: hRatio, text: "pay on delvery"),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            bottomSheet2(context, hRatio, wRatio, cardTap);
            //Navigator.pop(context);
          },
          child: OutlineButton(ws: 125, hr: hRatio, text: "pay with card"),
        ),
      ],
    ),
  ]);
}

bottomSheet2(
    BuildContext context, double hRatio, double wRatio, Function cardTap) {
  return showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      clipBehavior: Clip.hardEdge,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Icon(
                    Icons.cancel,
                    size: 60 * hRatio,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20 * hRatio,
              ),
              Container(
                //color: Colors.white,
                height: 350,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: secondPage(context, hRatio, wRatio, cardTap),
              ),
            ],
          ),
        );
      });
}

secondPage(
    BuildContext context, double hRatio, double wRatio, Function cardTap) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            SizedBox(height: 30 * hRatio),
            Padding(
              padding: EdgeInsets.only(left: 20.0 * wRatio, right: 20 * wRatio),
              child: Text('Card Holders Name'),
            ),
            SizedBox(
              height: 15 * hRatio,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0 * wRatio, right: 20 * wRatio),
              child: SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white)),
                      fillColor: Colors.grey[250],
                      hintText: 'Opadijo Toheeb',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      filled: true),
                ),
              ),
            ),
            SizedBox(height: 20 * hRatio),
            Padding(
              padding: EdgeInsets.only(left: 20.0 * wRatio, right: 20 * wRatio),
              child: Text("Card Number"),
            ),
            SizedBox(height: 10 * hRatio),
            Padding(
              padding: EdgeInsets.only(left: 20.0 * wRatio, right: 20 * wRatio),
              child: SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white)),
                      fillColor: Colors.grey[250],
                      hintText: '1234 5678 9012 1314',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      filled: true),
                ),
              ),
            ),
            SizedBox(
              height: 10 * hRatio,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0 * wRatio, right: 20 * wRatio),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date'),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 100,
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                fillColor: Colors.grey[250],
                                hintText: '10/30',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                filled: true),
                          ),
                        )
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Cvv'),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 100,
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                fillColor: Colors.grey[250],
                                hintText: '123',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                filled: true),
                          ),
                        )
                      ]),
                ],
              ),
            ),
          ],
        ),
        Container(
          height: 55,
          decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: Center(
            child: GestureDetector(
              onTap: () {
                goTo(context, OrderComplete());
              },
              child: Container(
                height: 35,
                width: 150,
                color: Colors.white,
                child: Center(
                  child: Text('Complete order'),
                ),
              ),
            ),
          ),
        )
      ]);
}
