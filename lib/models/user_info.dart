import "package:flutter/material.dart";

import "package:cafey_app/models/coffee.dart";

class UserInformation extends ChangeNotifier {
  // user cart
  final Map<Coffee, int> _userCoffeeCart = {};

  // user balance
  double _totalAmountToPay = 0.0;
  int _totalNumberOfCoffeeCups = 0;

  // user cart getters and methods
  Map<Coffee, int> get getUserCartContents => Map.unmodifiable(_userCoffeeCart);

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

  // user balance getters and methods
  double get totalAmountToPay => _totalAmountToPay;
  int get totalNumberOfCoffeeCups => _totalNumberOfCoffeeCups;

  void addCoffee(double price, int numberOfCups) {
    _totalAmountToPay += price;
    _totalNumberOfCoffeeCups += numberOfCups;
    notifyListeners();
  }

  void removeCoffee(double price, int numberOfCups) {
    _totalAmountToPay -= price;
    _totalNumberOfCoffeeCups -= numberOfCups;
    notifyListeners();
  }
}
