import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

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
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
        margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.w),
        width: double.infinity,
        decoration: BoxDecoration(
          color: _pressed ? Colors.grey.shade200 : Colors.brown,
          borderRadius: BorderRadius.circular(10.r),
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
