import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:kicks/model/product.dart';
import 'package:kicks/model/cart_item.dart';

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items);

  double getTotalCost(){
    var total = 0.0;
    _items.forEach((item) => total += item.itemTotal); 
    return total;
  }

  CartItem? findItem(Product product){
    for(var item in _items){
      if(item.product.name == product.name){
        return item;
      }
    }
    return null;
  }

  void addItem(Product product) {
    var existing = findItem(product);
    if (existing != null) {
      existing.quantity++;
    } else {
      _items.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeItem(Product product) {
    _items.removeWhere((item) => item.product.name == product.name);
    notifyListeners();
  }

  void increment(Product product){
    var existing = findItem(product);
    if(existing != null){
      existing.quantity++;
      notifyListeners(); // tells widgets when something has changed
    }
  }


  void decrement(Product product){
    var existing = findItem(product);
    if(existing != null){
      if(existing.quantity > 1){
        existing.quantity--;
      }else{
        _items.remove(existing);
      }
      notifyListeners();
    }
  }
}
