import 'package:flutter/foundation.dart';

class CartProviderItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartProviderItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class CartProvider with ChangeNotifier {
  Map<String, CartProviderItem> _items = {};

  Map<String, CartProviderItem> get items => {..._items};

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingItem) => CartProviderItem(
              id: existingItem.id,
              title: existingItem.title,
              quantity: existingItem.quantity + 1,
              price: price));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartProviderItem(
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              price: price));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void Clear() {
    _items = {};
    notifyListeners();
  }
}
