import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/customWidget/product_box.dart';
import 'package:fruit_hub/customWidget/tab_widget.dart';
import 'package:fruit_hub/providers.dart';
import 'package:fruit_hub/screens/my_basket.dart';
import 'package:fruit_hub/screens/single_product.dart';
import 'package:fruit_hub/utils/constant.dart';
import 'package:fruit_hub/utils/responsive_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/product_info.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  num total = 0;
  //List<ProductInfo> bask = ref.watch(basketProvider).basket;
  List<num> singleSum = [];
  int index = 0;
  List<Widget> tabWidgets = [
    HottestPage(),
    PopularPage(),
    NewComboPage(),
    TopPage()
  ];

  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(basketProvider);
    var read = ref.read(basketProvider.notifier);
    var modelread = ref.read(listProdider.notifier);
    double hRatio = ApplyLayout.shr(context, 812);
    double wRatio = ApplyLayout.swr(context, 375);
    final value = ref.watch(listProdider);
    return Scaffold(
        backgroundColor: const Color(0xfffffcfc),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 30 * wRatio, right: 30 * wRatio),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 70 * hRatio),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/Group 4.png'),
                      SizedBox(
                          child: Column(
                        children: [
                          GestureDetector(
                            onLongPress: () {
                              read.clearBasket();
                              read.clearBask();
                              ref.read(addProvider.notifier).reset();
                            },
                            onTap: () {
                              //baskTotal() {
                              // List<ProductInfo> bask =
                              //     ref.watch(basketProvider).basket;
                              // for (int m = 0; m < bask.length; m++) {
                              //   num singleTotal =
                              //       (bask[m].price * bask[m].quantity);
                              //   singleSum.add(singleTotal);
                              //   print(singleSum);
                              //   num singtotal =
                              //       singleSum.fold(0, (a, b) => a + b);
                              //   setState(() {
                              //     total = singtotal;
                              //   });
                              // }
                              // }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyBasket()));
                            },
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Stack(children: [
                                Icon(Icons.shopping_basket_rounded,
                                    color: Colors.orange, size: 25),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey[700]),
                                      child: Text(
                                        watch.basket.length.toString(),
                                        style: TextStyle(color: Colors.white),
                                      )),
                                )
                              ]),
                            ),
                          ),
                          const Text(
                            'My Basket',
                            style: TextStyle(color: Colors.black, fontSize: 10),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
                SizedBox(height: 25 * hRatio),
                RichText(
                  text: const TextSpan(
                      text: 'Hello Tony,',
                      style: TextStyle(
                          color: Color(0xff272146),
                          fontSize: 20,
                          fontWeight: FontWeight.w200),
                      children: [
                        TextSpan(
                          text: ' What fruit salad\ncombo do you want today?',
                          style: TextStyle(
                              color: Color(0xff272146),
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              height: 1.5),
                        )
                      ]),
                ),
                SizedBox(height: 25 * hRatio),
                Row(
                  children: [
                    SizedBox(
                      height: 56 * hRatio,
                      width: 280 * wRatio,
                      child: TextField(
                          decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(const Radius.circular(15)),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        hintText: 'Search for fruit salad combos',
                        hintStyle: const TextStyle(fontSize: 12),
                        prefixIcon: const Icon(Icons.search_rounded),
                        fillColor: Colors.grey[320],
                        filled: true,
                      )),
                    ),
                    SizedBox(
                      width: 10 * wRatio,
                    ),
                    const Icon(
                      Icons.history,
                      size: 24,
                    )
                  ],
                ),
                SizedBox(
                  height: 40 * hRatio,
                ),
                Text('Recommended Combo',
                    style: TextStyle(
                        fontSize: 20 * wRatio, color: Color(0xff272146))),
                SizedBox(height: 25 * hRatio),
                Container(
                  height: 183 * hRatio,
                  color: Colors.transparent,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          goTo(
                              context,
                              SingleProduct(
                                imageUrl: value[index].imageUrl,
                                productName: value[index].productName,
                                price: value[index].price,
                                ingredient:
                                    'Red Quinoa, Lime , Honey , Blueberries, Strawberries, Mango, Fresh mint',
                                liked: value[index].liked,
                                // onTap: () {
                                //   read.addToBasket(value[index]);
                                //   modelread.state[index].liked = true;
                                //   print(value[index].liked);
                                // },
                                // onTap2: () {
                                //   read.removeBasket(value[index]);
                                //   modelread.state[index].liked = false;
                                //   print(value[index].liked);
                                // },
                                index: index,
                              ));
                        },
                        child: ProductBox(
                            imageUrl: value[index].imageUrl,
                            productName: value[index].productName,
                            price: value[index].price.toString(),
                            liked: value[index].liked,
                            onTapLiked: (value) {
                              //ref.read(listProdider.notifier).
                            }),
                      );
                    },
                  ),
                ),
                // Container(
                //     height: 183 * hRatio,
                //     color: Colors.transparent,
                //     child: ListView(
                //       shrinkWrap: true,
                //       scrollDirection: Axis.horizontal,
                //       children: [
                //         ProductBox(),
                //         ProductBox(),
                //         ProductBox(),
                //         ProductBox(),
                //       ],
                //     )),
                SizedBox(height: 45 * hRatio),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 0;
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hottest',
                                style: index == 0
                                    ? TextStyle(
                                        fontSize: 18, color: Color(0xff272146))
                                    : TextStyle(
                                        fontSize: 15, color: Color(0xff938db5)),
                              ),
                              SizedBox(height: 1 * hRatio),
                              SizedBox(
                                width: 20 * wRatio,
                                child: Divider(
                                  color: index == 0
                                      ? Colors.orange
                                      : Colors.transparent,
                                  thickness: 2,
                                ),
                              ),
                            ],
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 1;
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Popular',
                                style: index == 1
                                    ? TextStyle(
                                        fontSize: 18, color: Color(0xff272146))
                                    : TextStyle(
                                        fontSize: 15, color: Color(0xff938db5)),
                              ),
                              SizedBox(height: 2 * hRatio),
                              SizedBox(
                                width: 30 * wRatio,
                                child: Divider(
                                  color: index == 1
                                      ? Colors.orange
                                      : Colors.transparent,
                                  thickness: 2,
                                ),
                              ),
                            ],
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 2;
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'New combo',
                                style: index == 2
                                    ? TextStyle(
                                        fontSize: 18, color: Color(0xff272146))
                                    : TextStyle(
                                        fontSize: 15, color: Color(0xff938db5)),
                              ),
                              SizedBox(height: 2 * hRatio),
                              SizedBox(
                                width: 30 * wRatio,
                                child: Divider(
                                  color: index == 2
                                      ? Colors.orange
                                      : Colors.transparent,
                                  thickness: 2,
                                ),
                              ),
                            ],
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 3;
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Top',
                                style: index == 3
                                    ? TextStyle(
                                        fontSize: 18, color: Color(0xff272146))
                                    : TextStyle(
                                        fontSize: 15, color: Color(0xff938db5)),
                              ),
                              SizedBox(height: 2 * hRatio),
                              SizedBox(
                                width: 30 * wRatio,
                                child: Divider(
                                  color: index == 3
                                      ? Colors.orange
                                      : Colors.transparent,
                                  thickness: 2,
                                ),
                              ),
                            ],
                          )),
                    ]),
                SizedBox(height: 15 * hRatio),
                tabWidgets[index]
              ],
            ),
          ),
        ));
  }
}
