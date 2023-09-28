import 'package:auto_size_text/auto_size_text.dart';
import "package:flutter/material.dart";
import 'package:fruit_hub/customWidget/custom_container.dart';
import 'package:fruit_hub/providers.dart';
import 'package:fruit_hub/screens/order_complete.dart';
import 'package:fruit_hub/utils/basket_product.dart';
import 'package:fruit_hub/utils/constant.dart';
import 'package:fruit_hub/utils/responsive_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Favorite extends ConsumerStatefulWidget {
  const Favorite({super.key});

  @override
  ConsumerState<Favorite> createState() => _MyBasketState();
}

class _MyBasketState extends ConsumerState<Favorite> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(basketProvider);
    var read = ref.read(basketProvider.notifier);
    double hRatio = ApplyLayout.shr(context, 812);
    double wRatio = ApplyLayout.swr(context, 375);
    return Scaffold(
      body: Column(children: [
        Container(
          height: 150 * hRatio,
          width: double.maxFinite,
          color: Colors.orange,
          child: Padding(
            padding: EdgeInsets.only(left: 15.0 * wRatio, top: 50 * hRatio),
            child: Row(
              children: [
                GoBackButton(),
                SizedBox(width: 60 * hRatio),
                Text(
                  'My Basket',
                  style: textStyle2(wRatio, Colors.white),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: SizedBox(
            height: 550 * hRatio,
            child: ListView.builder(
              itemCount: watch.favorite.length,
              itemBuilder: (BuildContext context, int index) {
                final item = watch.basket[index];
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    setState(() {
                      read.removeBasket(watch.basket[index]);
                      print(watch.basket.length);
                    });
                  },
                  //background: Container(color: Colors.red),
                  child: BasketContainer(
                    productName: watch.basket[index].productName,
                    quantity: watch.basket[index].price.toString(),
                    price: watch.basket[index].price.toString(),
                    url: watch.basket[index].imageUrl,
                  ),
                );
              },
              // children: [
              //   BasketContainer(),
              //   BasketContainer(),
              //   BasketContainer(),
              //   BasketContainer(),
              // ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0, right: 20, left: 20),
          child: SizedBox(
            height: 56 * hRatio,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: textStyle1(wRatio, Colors.blue),
                      ),
                      AutoSizeText("N 80,000",
                          style: textStyle3(wRatio, Colors.blue))
                    ]),
                GestureDetector(
                    onTap: () {
                      bottomSheet1(context, hRatio, wRatio, () {
                        //  bottomSheet2(context, hRatio, wRatio, () {});
                      });
                    },
                    child: Button(ws: 180, hr: hRatio, text: 'Checkout')),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
