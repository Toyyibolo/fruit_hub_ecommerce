//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_hub/utils/product_info.dart';

class BasketNotifier extends ChangeNotifier {
  List<ProductInfo> _basket = [];
  List<ProductInfo> _favorite = [];
  List singleSum = [];
  num total = 0;

  List<ProductInfo> get basket => _basket;
  List<ProductInfo> get favorite => _favorite;

  void addToBasket(ProductInfo productInfo) {
    _basket.add(productInfo);
    notifyListeners();
  }

  void removeBasket(ProductInfo productInfo) {
    _basket.remove(productInfo);
    notifyListeners();
  }

  void clearBasket() {
    _basket.clear();
    notifyListeners();
  }

  void addToFavorite(ProductInfo productInfo) {
    _basket.add(productInfo);
    notifyListeners();
  }

  void removeFavorite(ProductInfo productInfo) {
    _basket.remove(productInfo);
    notifyListeners();
  }

  void clearFavorite() {
    _basket.clear();
    notifyListeners();
  }

  void totalAmount() {
    if (_basket.isNotEmpty) {
      singleSum.clear();
      total = 0;
      for (int m = 0; m < _basket.length; m++) {
        num singleTotal = (_basket[m].price * _basket[m].quantity);
        singleSum.add(singleTotal);
        print(singleSum);
        num singtotal = singleSum.fold(0, (a, b) => a + b);
        total = singtotal;
        print(total);
        notifyListeners();
      }
    } else {
      total = 0;
    }
    notifyListeners();
  }

  void removed(index) {
    if (_basket.isNotEmpty) {
      num singleTotal = _basket[index].price * _basket[index].quantity;
      total - singleTotal;
      notifyListeners();
    } else {
      total = 0;
    }
  }

  void productRemoved(int index) {
    if (_basket.isNotEmpty) {
      singleSum.removeAt(index);
      print(singleSum);
      num singtotal = singleSum.fold(0, (a, b) => a + b);
      total = singtotal;
      print(total);
      notifyListeners();
    } else {
      total = 0;
    }
    notifyListeners();
  }

  void clearBask() {
    singleSum.clear();
    print(singleSum);
    num singtotal = singleSum.fold(0, (a, b) => a + b);
    total = singtotal;
    print(total);
    notifyListeners();
  }
}
