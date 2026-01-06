import "package:flutter/material.dart";

import "package:provider/provider.dart";

import "package:cafey_app/components/shop_coffee_tile.dart";

import "package:cafey_app/models/coffe_store.dart";
import "package:cafey_app/models/coffee.dart";
import "package:cafey_app/models/user_info.dart";

import "package:cafey_app/utils/strings.dart";
import "package:cafey_app/utils/cafey_toast.dart";

class ShoppingSection extends StatefulWidget {
  const ShoppingSection({super.key});

  @override
  State<ShoppingSection> createState() => _ShoppingSectionState();
}

class _ShoppingSectionState extends State<ShoppingSection> {
  final List<Coffee> allAvailableCoffee = CoffeeStore.getCoffeeShopProducts;

  void addCoffeeProductToCart(
    Coffee userCoffeeChoice,
    UserInformation userInfo,
  ) {
    if (userInfo.getUserCartContents.containsKey(userCoffeeChoice)) {
      showCafeyToast(
        context,
        "${userCoffeeChoice.name} has already\nbeen added to cart",
        ToastType.warning,
      );
      return;
    }
    userInfo.addItemToCart(userCoffeeChoice);
    userInfo.addCoffee(double.parse(userCoffeeChoice.price), 1);
    showCafeyToast(
      context,
      "${userCoffeeChoice.name} added successfully!",
      ToastType.success,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInformation>(
      builder: (context, userInfo, child) => SafeArea(
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
                      onAddPressed: () =>
                          addCoffeeProductToCart(coffee, userInfo),
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
