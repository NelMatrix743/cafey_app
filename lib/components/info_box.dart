import "package:flutter/material.dart";

import "package:flutter_screenutil/flutter_screenutil.dart";

class InfoBox extends StatelessWidget {
  final String infoType;
  final String value;

  const InfoBox({super.key, required this.infoType, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.brown, width: 1.h),
        borderRadius: BorderRadius.circular(3.r),
      ),
      child: Text.rich(
        TextSpan(
          text: infoType,
          style: TextStyle(fontSize: 16.sp, color: Colors.brown),
          children: [
            TextSpan(
              text: value,
              style: TextStyle(fontSize: 16.sp, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
