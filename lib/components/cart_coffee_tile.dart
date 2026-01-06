import "package:flutter/material.dart";

import "package:provider/provider.dart";
import "package:flutter_slidable/flutter_slidable.dart";

import "package:cafey_app/components/cart_content_button.dart";

import "package:cafey_app/models/coffee.dart";
import "package:cafey_app/models/user_info.dart";

import "package:cafey_app/utils/strings.dart";
import "package:cafey_app/utils/image_assets.dart";
import "package:cafey_app/utils/cafey_toast.dart";

class CartContentTile extends StatelessWidget {
  final Coffee selectedCoffee;
  final VoidCallback deleteAction;

  const CartContentTile({
    super.key,
    required this.selectedCoffee,
    required this.deleteAction,
  });

  void addACup(
    BuildContext context,
    UserInformation userInfo,
    int cups,
    double price,
  ) {
    if (cups < 5) {
      userInfo.addItemToCart(selectedCoffee);
      userInfo.addCoffee(price, 1);
    } else {
      showCafeyToast(context, maxCupNumberExceeded, ToastType.warning);
    }
  }

  void removeACup(
    BuildContext context,
    UserInformation userInfo,
    int cups,
    double price,
  ) {
    if (cups > 1) {
      userInfo.removeItemFromCart(selectedCoffee);
      userInfo.removeCoffee(price, 1);
    } else {
      showCafeyToast(context, minCupNumberExceeded, ToastType.warning);
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserInformation userInfo = context.watch<UserInformation>();

    final int numberOfCups = userInfo.getUserCartContents[selectedCoffee]!;
    final double coffeeProductPrice = double.parse(selectedCoffee.price);

    return Slidable(
      endActionPane: ActionPane(
        motion: BehindMotion(),
        extentRatio: 0.4,
        children: <Widget>[
          CustomSlidableAction(
            onPressed: ((context) => deleteAction()),
            foregroundColor: Colors.white,
            backgroundColor: Colors.brown,
            borderRadius: BorderRadius.circular(12),
            child: ImageIcon(deleteTileFilledIcon, size: 25),
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
                  context,
                  userInfo,
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
                  context,
                  userInfo,
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
