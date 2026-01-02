import "package:flutter/material.dart";
import "./coffee.dart";

class UserCart extends ChangeNotifier {
  final Set<Coffee> _userCoffeeCart = <Coffee>{};

  Set<Coffee> get getUserCart => _userCoffeeCart;

  void addItemToCart(Coffee coffeeProduct) {
    _userCoffeeCart.add(coffeeProduct);
  }

  void removeItemFromCart(Coffee coffeeProuct) {
    _userCoffeeCart.remove(coffeeProuct);
  }
}
