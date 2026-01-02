import "package:flutter/material.dart";
import "package:cafey_app/models/coffee.dart";

class CartContentTile extends StatefulWidget {
  final Coffee selectedCoffee;
  final void Function(double) addToTotalAmountAndCoffeeCups;
  final void Function(double) removeFromTotalAmountAndCoffeeCups;

  const CartContentTile({
    super.key,
    required this.selectedCoffee,
    required this.addToTotalAmountAndCoffeeCups,
    required this.removeFromTotalAmountAndCoffeeCups,
  });

  @override
  State<CartContentTile> createState() => _CartContentTileState();
}

class _CartContentTileState extends State<CartContentTile> {
  int _numberOfCups = 1;

  void addACup() {
    setState(() {
      if (!(_numberOfCups > 5)) {
        _numberOfCups += 1;
        widget.addToTotalAmountAndCoffeeCups(
          double.parse(widget.selectedCoffee.price),
        );
      } else {
        // show a toast, telling users "a coffee can't have more than 5 cups";
      }
    });
  }

  void removeACup() {
    setState(() {
      if (!(_numberOfCups < 1)) {
        _numberOfCups -= 1;
        widget.removeFromTotalAmountAndCoffeeCups(
          double.parse(widget.selectedCoffee.price),
        );
      } else {
        // show a toast, telling users "a coffee can't have less than 1 cups";
        // "please slide to delete";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      margin: const EdgeInsets.only(bottom: 15.0),
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 5),
      child: ListTile(
        title: Text(widget.selectedCoffee.name),
        subtitle: Container(
          margin: EdgeInsets.only(top: 5),
          child: Text(
            widget.selectedCoffee.price,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        leading: Image(
          image: widget.selectedCoffee.coffeeImage,
          width: 70.0,
          height: 70.0,
        ),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(onPressed: removeACup, icon: Icon(Icons.remove)),
            Text(_numberOfCups.toString()),
            IconButton(onPressed: addACup, icon: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
