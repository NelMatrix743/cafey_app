import "./coffee.dart";

class UserCart {
  final List<Coffee> _userCoffeeCart = <Coffee>[];

  List<Coffee> get getUserCart => _userCoffeeCart;

  void addItemToCart(Coffee coffeeProduct) {
    _userCoffeeCart.add(coffeeProduct);
  }

  void removeItemFromCart(Coffee coffeeProuct) {
    _userCoffeeCart.remove(coffeeProuct);
  }
}
