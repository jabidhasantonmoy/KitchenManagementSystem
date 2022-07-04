import 'package:flutter/foundation.dart';

import './bazarlist.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<BazarItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(
    List<BazarItem> bazarProducts,
    double total,
  ) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        products: bazarProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
