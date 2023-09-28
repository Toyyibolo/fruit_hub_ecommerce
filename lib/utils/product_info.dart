// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:flutter_riverpod/flutter_riverpod.dart";

class ProductInfo {
  int id;
  String imageUrl;
  String productName;
  int price;
  bool liked = false;
  int quantity;
  ProductInfo({
    required this.id,
    required this.imageUrl,
    required this.productName,
    required this.price,
    required this.liked,
    required this.quantity,
  });
}
