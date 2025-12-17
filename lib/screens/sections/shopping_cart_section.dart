import "package:cafey_app/models/coffe_store.dart";
import "package:cafey_app/models/coffee.dart";
import "package:cafey_app/models/user_cart.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../../utils/strings.dart";

class ShoppingCartSection extends StatefulWidget {
  const ShoppingCartSection({super.key});

  @override
  State<ShoppingCartSection> createState() => _ShoppingCartSectionState();
}

class _ShoppingCartSectionState extends State<ShoppingCartSection> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserCart>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(12.0, 20.0, 12.0, 15.0),
          child: Column(
            children: <Widget>[
              const Text(
                coffeePresentationQuestion,
                style: TextStyle(
                  fontSize: 17,
                  // fontFamily: "Consolas",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
