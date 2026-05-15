import 'package:flutter/foundation.dart';

import '../models/product.dart';

class CartStore {
  CartStore._();

  static final CartStore instance = CartStore._();

  final ValueNotifier<List<Product>> products = ValueNotifier<List<Product>>([]);

  void add(Product product) {
    products.value = [...products.value, product];
  }
}
