import 'package:flutter/material.dart';

class CafeyPayButton extends StatefulWidget {
  final VoidCallback onTapCallBack;
  const CafeyPayButton({super.key, required this.onTapCallBack});

  @override
  State<CafeyPayButton> createState() => _CafeyPayButtonState();
}

class _CafeyPayButtonState extends State<CafeyPayButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTapCallBack,
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: _pressed ? Colors.grey.shade200 : Colors.brown,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "PAY NOW",
            style: TextStyle(
              color: _pressed ? Colors.brown : Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
