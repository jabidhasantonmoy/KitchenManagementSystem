import 'package:flutter/foundation.dart';

class BazarItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  BazarItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Bazarlist with ChangeNotifier {
  late Map<String, BazarItem> _items = {};
  Map<String, BazarItem> get items {
    return {..._items};
  }

  int get itemCount {
    // ignore: unnecessary_null_comparison
    return _items == null ? 0 : _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, bazarItem) {
      total += bazarItem.price * bazarItem.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingBazarItem) => BazarItem(
          id: existingBazarItem.id,
          title: existingBazarItem.title,
          price: existingBazarItem.price,
          quantity: existingBazarItem.quantity + 1,
        ),
      );
      // change quantity
    } else {
      _items.putIfAbsent(
        productId,
        () => BazarItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
