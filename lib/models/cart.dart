import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String test;
  final int quanity;
  final double mrp;

  CartItem(
      {@required this.id,
      @required this.test,
      @required this.quanity,
      @required this.mrp});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;

    _items.forEach((key, cartItem) {
      total += cartItem.quanity * cartItem.mrp;
    });

    return total;
  }

  void addItem(String productId, String test, double mrp) {
    if (_items.containsKey(productId)) {
      // change quantity...
      _items.update(
          productId,
          (existingCardItem) => CartItem(
              id: existingCardItem.id,
              test: existingCardItem.test,
              mrp: existingCardItem.mrp,
              quanity: existingCardItem.quanity + 1));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(), test: test, mrp: mrp, quanity: 1));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }

    if (_items[productId].quanity > 1) {
      // reduce quantity...

      _items.update(
          productId,
          (existingCardItem) => CartItem(
              id: existingCardItem.id,
              test: existingCardItem.test,
              mrp: existingCardItem.mrp,
              quanity: existingCardItem.quanity - 1));
    } else {
      _items.remove(productId);
    }

    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
