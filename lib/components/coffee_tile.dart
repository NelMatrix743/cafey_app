import "package:cafey_app/models/coffee.dart";
import "package:flutter/material.dart";

class CoffeeProductTile extends StatelessWidget {
  final Coffee coffeeProduct;
  final void Function() onAddPressed;
  const CoffeeProductTile({
    super.key,
    required this.coffeeProduct,
    required this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      margin: const EdgeInsets.only(bottom: 15.0),
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10),
      child: ListTile(
        title: Text(coffeeProduct.name),
        subtitle: Container(
          margin: EdgeInsets.only(top: 5),
          child: Text(
            coffeeProduct.price,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        leading: Image(
          image: coffeeProduct.coffeeImage,
          width: 70.0,
          height: 70.0,
        ),
        trailing: IconButton(
          icon: Icon(Icons.add),
          onPressed: onAddPressed,
          style: IconButton.styleFrom(
            backgroundColor: Colors.brown,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
