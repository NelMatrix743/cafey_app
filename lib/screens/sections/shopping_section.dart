import "package:cafey_app/components/shop_coffee_tile.dart";
import "package:cafey_app/models/coffe_store.dart";
import "package:cafey_app/models/coffee.dart";
import "package:cafey_app/models/user_cart.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../../utils/strings.dart";

class ShoppingSection extends StatefulWidget {
  const ShoppingSection({super.key});

  @override
  State<ShoppingSection> createState() => _ShoppingSectionState();
}

class _ShoppingSectionState extends State<ShoppingSection> {
  final List<Coffee> allAvailableCoffee = CoffeeStore.getCoffeeShopProducts;

  void addCoffeeProductToCart(Coffee userCoffeeChoice) {
    Provider.of<UserCart>(
      context,
      listen: false,
    ).addItemToCart(userCoffeeChoice);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserCart>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  coffeePresentationQuestion,
                  style: TextStyle(
                    fontSize: 17,
                    // fontFamily: "Consolas",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: allAvailableCoffee.length,
                  itemBuilder: (context, index) {
                    Coffee coffee = allAvailableCoffee[index];
                    return CoffeeProductTile(
                      coffeeProduct: coffee,
                      onAddPressed: () => addCoffeeProductToCart(coffee),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
