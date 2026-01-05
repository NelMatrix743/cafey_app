import "package:cafey_app/components/cart_content_button.dart";
import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";
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

  void deleteContentFromCart() {}

  @override
  Widget build(BuildContext context) {
    final UserCart userCart = context.watch<UserCart>();
    final UserBalance userBalance = context.read<UserBalance>();

    final int numberOfCups = userCart.getUserCartContents[selectedCoffee]!;
    final double coffeeProductPrice = double.parse(selectedCoffee.price);

    return Slidable(
      endActionPane: ActionPane(
        motion: BehindMotion(),
        extentRatio: 0.4,
        children: <Widget>[
          SlidableAction(
            onPressed: ((context) => deleteContentFromCart()),
            icon: Icons.delete,
            foregroundColor: Colors.white,
            backgroundColor: Colors.brown,
            borderRadius: BorderRadius.circular(12),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
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
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CartContentButton(
                icon: Icon(Icons.remove),
                onPressed: () => removeACup(
                  userCart,
                  userBalance,
                  numberOfCups,
                  coffeeProductPrice,
                ),
              ),
              SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.brown, width: 2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  numberOfCups.toString(),
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(width: 8),
              CartContentButton(
                icon: Icon(Icons.add),
                onPressed: () => addACup(
                  userCart,
                  userBalance,
                  numberOfCups,
                  coffeeProductPrice,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
