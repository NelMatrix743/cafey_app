import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "package:cafey_app/models/coffee.dart";
import "package:cafey_app/models/user_cart.dart";
import "package:cafey_app/models/user_balance.dart";
import "package:cafey_app/components/info_header.dart";
import "package:cafey_app/components/cart_coffee_tile.dart";

class CartSection extends StatelessWidget {
  const CartSection({super.key});

  void removeThisCoffeeCompletelyFromCart(
    UserCart userCart,
    UserBalance userBalance,
    Coffee selectedCoffee,
  ) {
    int numberOfCups = userCart.removeItemFromCartCompletely(selectedCoffee);
    double totalPriceToDeduct =
        double.parse(selectedCoffee.price) * numberOfCups;
    userBalance.removeCoffee(totalPriceToDeduct, numberOfCups);
  }

  @override
  Widget build(BuildContext context) {
    final UserBalance userBalance = context.read<UserBalance>();
    return Consumer<UserCart>(
      builder: (context, userCart, child) => SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
          child: Column(
            children: [
              InformationHeader(),
              SizedBox(height: 30),
              // ListBuilder,
              Expanded(
                child: userCart.getUserCartContents.isEmpty
                    ? const Center(child: Text("Your cart is empty"))
                    : ListView.separated(
                        itemCount: userCart.getUserCartContents.length,
                        itemBuilder: (context, index) {
                          final entry = userCart.getUserCartContents.entries
                              .elementAt(index);
                          final Coffee coffee = entry.key;
                          return CartContentTile(
                            selectedCoffee: coffee,
                            deleteAction: () =>
                                removeThisCoffeeCompletelyFromCart(
                                  userCart,
                                  userBalance,
                                  coffee,
                                ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 15),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
