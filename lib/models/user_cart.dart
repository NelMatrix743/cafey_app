import "package:flutter/material.dart";
import "./coffee.dart";

class UserCart extends ChangeNotifier {
  final Map<Coffee, int> _userCoffeeCart = {};

  Map<Coffee, int> get getUserCartContents => _userCoffeeCart;

  void addItemToCart(Coffee coffeeProduct) {
    _userCoffeeCart.update(
      coffeeProduct,
      (value) => value + 1,
      ifAbsent: () => 1,
    );
    notifyListeners();
  }

  void removeItemFromCart(Coffee coffeeProduct) {
    if (!_userCoffeeCart.containsKey(coffeeProduct)) return;

    if (_userCoffeeCart[coffeeProduct]! > 1) {
      _userCoffeeCart[coffeeProduct] = _userCoffeeCart[coffeeProduct]! - 1;
    } else {
      _userCoffeeCart.remove(coffeeProduct);
    }
    notifyListeners();
  }

  int removeItemFromCartCompletely(Coffee coffeeProduct) {
    int numberOfCups = _userCoffeeCart.remove(coffeeProduct)!;
    notifyListeners();
    return numberOfCups;
  }
}
