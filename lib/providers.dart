import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_hub/basket_provider.dart';
import 'package:fruit_hub/utils/product_info.dart';

//class cartStateNotifier extends StateNotifier<List<>>

final listProdider = StateProvider<List<ProductInfo>>((ref) {
  return infos;
});

final likedProvider = StateProvider<bool>((ref) {
  return false;
});

final basketProvider = ChangeNotifierProvider((ref) => BasketNotifier());

final addProvider = ChangeNotifierProvider((ref) => AddedList());

final quantityProvider = ChangeNotifierProvider((ref) => QuantityList());

List<bool> addedListHelper =
    List<bool>.generate(infos.length, (index) => false);

List<ProductInfo> infos = [
  ProductInfo(
      imageUrl:
          'assets/breakfast-quinoa-and-red-fruit-salad-134061-1-removebg-preview 2.png',
      productName: 'Quinoa fruit salad',
      price: 2000,
      liked: false,
      quantity: 1,
      id: 0),
  ProductInfo(
      imageUrl:
          'assets/breakfast-quinoa-and-red-fruit-salad-134061-1-removebg-preview 2.png',
      productName: 'Tropical fruit salad',
      price: 3000,
      liked: false,
      quantity: 1,
      id: 1),
  ProductInfo(
      imageUrl:
          'assets/breakfast-quinoa-and-red-fruit-salad-134061-1-removebg-preview 2.png',
      productName: 'Salsa fruit salad',
      price: 2500,
      liked: false,
      quantity: 1,
      id: 2),
  ProductInfo(
      imageUrl:
          'assets/breakfast-quinoa-and-red-fruit-salad-134061-1-removebg-preview 2.png',
      productName: 'Honey flavoured fruit salad',
      price: 2000,
      liked: false,
      quantity: 1,
      id: 3),
  ProductInfo(
      imageUrl: 'assets/Rg.jpg',
      productName: 'Milk flavoured fruit salad',
      price: 3750,
      liked: false,
      quantity: 1,
      id: 4),
  ProductInfo(
      imageUrl: 'assets/Rg.jpg',
      productName: 'Ginger flavoured fruit salad',
      price: 5200,
      liked: false,
      quantity: 1,
      id: 5)
];

class AddedList extends ChangeNotifier {
  // List addList = List<bool>.generate(infos.length, (index) => false);
  List<ProductInfo> pInfos = infos;

  void onPressed(int index) {
    bool pressed = infos[index].liked;
    infos[index].liked = !pressed;
    notifyListeners();
  }

  void reset() {
    for (int m = 0; m < infos.length; m++) {
      infos[m].liked = false;
      //notifyListeners();
    }
    notifyListeners();
  }
}

class QuantityList extends ChangeNotifier {
  List<ProductInfo> infoList = infos;

  void increase(int index) {
    int pressed = infos[index].quantity;
    infos[index].quantity++;
    notifyListeners();
  }

  void decrease(int index) {
    int pressed = infos[index].quantity;
    infos[index].quantity--;
    notifyListeners();
  }
}

class LocationList extends ChangeNotifier {
  List addList = List<int>.generate(infos.length, (index) => index + 1);

  void location(int index, int location) {
    // print(add)
    addList[index] = location;
    notifyListeners();
  }
}
