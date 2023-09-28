// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_hub/basket_provider.dart';

import 'package:fruit_hub/customWidget/custom_container.dart';
import 'package:fruit_hub/providers.dart';
import 'package:fruit_hub/screens/my_basket.dart';
import 'package:fruit_hub/utils/constant.dart';
import 'package:fruit_hub/utils/responsive_helper.dart';

final addedProvider = StateProvider<bool>((ref) {
  return false;
});

class SingleProduct extends ConsumerStatefulWidget {
  String imageUrl;
  String productName;
  int price;
  String ingredient;
  //Function() onTap;
  // ignore: non_constant_identifier_names
  bool liked;
  //Function() onTap2;
  int index;
  SingleProduct({
    Key? key,
    required this.imageUrl,
    required this.productName,
    required this.price,
    required this.ingredient,
    required this.liked,
    required this.index,
  }) : super(key: key);
  @override
  ConsumerState<SingleProduct> createState() => SingleProductState();
}

class SingleProductState extends ConsumerState<SingleProduct> {
  int location = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      location = widget.index;
    });
  }

  // bool pressed = false;
  @override
  Widget build(BuildContext context) {
    double hRatio = ApplyLayout.shr(context, 812);
    double wRatio = ApplyLayout.swr(context, 375);
    var modelread = ref.read(listProdider.notifier);
    final value = ref.watch(listProdider);
    var read = ref.read(basketProvider.notifier);
    var pressed = ref.watch(addProvider).pInfos[location].liked;

    bool liked = value[widget.index].liked;
    var quantity = ref.watch(quantityProvider).infoList[location].quantity;
    num amount = quantity + widget.price;

    return Scaffold(
        backgroundColor: Colors.orange,
        body: Column(
          children: [
            Container(
              color: Colors.orange,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 25 * wRatio, top: 80 * hRatio),
                        child: GoBackButton(),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 101 * wRatio,
                        top: 20 * hRatio,
                        right: 101 * wRatio,
                        bottom: 20 * hRatio),
                    child: SizedBox(
                      height: 180,
                      child: Image.asset(widget.imageUrl
                          // 'assets/breakfast-quinoa-and-red-fruit-salad-134061-1-removebg-preview 2.png'
                          ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40 * hRatio),
                    Text(
                      widget.productName,
                      //'Quinoa Fruit Salad',
                      style: TextStyle(
                          fontSize: 20 * wRatio,
                          color: const Color(0xff272146)),
                    ),
                    SizedBox(height: 25 * hRatio),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      ref
                                          .read(quantityProvider)
                                          .decrease(location);
                                    },
                                    child: Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                        child: const Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              '-',
                                              style: TextStyle(fontSize: 25),
                                            ))),
                                  ),
                                ),
                              ),
                            ),
                            Text(quantity.toString()),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: GestureDetector(
                                onTap: () {
                                  ref.read(quantityProvider).increase(location);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.orange[200]),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.orange,
                                      size: 25,
                                    )),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Text(
                            "N ${widget.price.toString()}",
                            //'N 2000'
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30 * hRatio),
                    const Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Divider(
                        thickness: 0.5,
                      ),
                    ),
                    SizedBox(height: 30 * hRatio),
                    const Text('One Pack Contains:'),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: AutoSizeText(widget.ingredient
                          //'Red Quinoa, Lime , Honey , Blueberries, Strawberries, Mango, Fresh mint'
                          ),
                    ),
                    SizedBox(height: 30 * hRatio),
                    const Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Divider(
                        thickness: 0.5,
                      ),
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 70),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 20.0 * wRatio),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.orange[200]),
                                          child: const Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Icon(Icons
                                                  .favorite_border_outlined))),
                                      GestureDetector(
                                          onTap: pressed
                                              ? () {
                                                  //read.removeBasket(value[widget.index]);

                                                  // ref
                                                  //     .read(addProvider.notifier)
                                                  //     .onPressed(location);

                                                  // print(addedListHelper);
                                                  //read.productRemoved(location);
                                                  //ref.read(basketProvider).totalAmount();
                                                }
                                              : () {
                                                  read.addToBasket(
                                                      value[widget.index]);
                                                  ref
                                                      .read(
                                                          addProvider.notifier)
                                                      .onPressed(
                                                          value[location].id);
                                                  ref
                                                      .read(basketProvider)
                                                      .totalAmount();
                                                },
                                          child: Button(
                                              ws: 219,
                                              hr: hRatio,
                                              text: pressed
                                                  ? 'Added to Basket'
                                                  : 'Add to Basket')),
                                    ]),
                              ),
                            ]),
                      ],
                    ),
                  ],
                ),
              ),
            )),
          ],
        ));
  }
}


//x = 101 y= 106
//x = 24 y= 64 
//80 by 32
