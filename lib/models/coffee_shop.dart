import 'package:flutter/material.dart';
import 'package:mocha_market/models/coffee.dart';

class CoffeeShop extends ChangeNotifier {
  //coffee for sale list
  final List<Coffee> _shop = [
    Coffee(
        name: 'Long Black', price: '4.10', imagePath: 'lib/images/black.png'),
    Coffee(name: 'Latte', price: '4.20', imagePath: 'lib/images/latte.png'),
    Coffee(
        name: 'Espresso', price: '3.50', imagePath: 'lib/images/espresso.png'),
    Coffee(
        name: 'Iced Coffee',
        price: '4.40',
        imagePath: 'lib/images/iced-coffee.png'),
  ];

  //user cart
  final List<Coffee> _userCart = [];

  //get the coffee shop
  List<Coffee> get coffeeShop => _shop;

  //get the user cart shop
  List<Coffee> get userCart => _userCart;

  //add item to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
