import "package:flutter/material.dart";

class UserBalance extends ChangeNotifier {
  double _totalAmountToPay = 0.0;
  int _totalNumberOfCoffeeCups = 0;

  double get totalAmountToPay => _totalAmountToPay;
  int get totalNumberOfCoffeeCups => _totalNumberOfCoffeeCups;

  void addCoffee(double price) {
    _totalAmountToPay += price;
    _totalNumberOfCoffeeCups += 1;
    notifyListeners();
  }

  void removeCoffee(double price) {
    _totalAmountToPay -= price;
    _totalNumberOfCoffeeCups -= 1;
    notifyListeners();
  }
}
