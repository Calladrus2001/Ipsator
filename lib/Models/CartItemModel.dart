import 'package:flutter/cupertino.dart';

class CartItem {
  String? name;
  String? crust;
  String? size;
  int quantity = 0;
  int? price;

  CartItem(name, crust, size, quantity, price) {
    this.name = name;
    this.crust = crust;
    this.size = size;
    this.quantity = quantity;
    this.price = price;
  }
}
