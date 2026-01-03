import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "package:cafey_app/models/coffee.dart";
import "package:cafey_app/models/user_cart.dart";
import "package:cafey_app/models/user_balance.dart";

class CartContentTile extends StatelessWidget {
  final Coffee selectedCoffee;

  const CartContentTile({super.key, required this.selectedCoffee});

  void addACup(UserCart cart, UserBalance balance, int cups, double price) {
    if (cups < 5) {
      cart.addItemToCart(selectedCoffee);
      balance.addCoffee(price);
    } else {
      // show a toast, telling users "a coffee can't have more than 5 cups";
    }
  }

  void removeACup(UserCart cart, UserBalance balance, int cups, double price) {
    if (cups > 1) {
      cart.removeItemFromCart(selectedCoffee);
      balance.removeCoffee(price);
    } else {
      // show a toast, telling users "a coffee can't have less than 1 cups";
      // "please slide to delete";
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserCart userCart = context.watch<UserCart>();
    final UserBalance userBalance = context.read<UserBalance>();

    final int numberOfCups = userCart.getUserCartContents[selectedCoffee]!;
    final double coffeeProductPrice = double.parse(selectedCoffee.price);

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      margin: const EdgeInsets.only(bottom: 15.0),
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 5),
      child: ListTile(
        title: Text(selectedCoffee.name),
        subtitle: Container(
          margin: EdgeInsets.only(top: 5),
          child: Text(
            selectedCoffee.price,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        leading: Image(
          image: selectedCoffee.coffeeImage,
          width: 70.0,
          height: 70.0,
        ),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              onPressed: () => removeACup(
                userCart,
                userBalance,
                numberOfCups,
                coffeeProductPrice,
              ),
              icon: Icon(Icons.remove),
            ),
            Text(numberOfCups.toString()),
            IconButton(
              onPressed: () => addACup(
                userCart,
                userBalance,
                numberOfCups,
                coffeeProductPrice,
              ),
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
