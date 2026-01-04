import 'package:flutter/material.dart';

class CartContentButton extends StatelessWidget {
  final Icon icon;
  final void Function() onPressed;
  const CartContentButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
      ),
      icon: icon,
    );
  }
}
