import "package:flutter/material.dart";

import "package:flutter_screenutil/flutter_screenutil.dart";

import "package:cafey_app/models/coffee.dart";

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
        borderRadius: BorderRadius.all(Radius.circular(15.0.r)),
      ),
      margin: EdgeInsets.only(bottom: 15.0.h),
      padding: EdgeInsets.symmetric(vertical: 30.0.h, horizontal: 10.w),
      child: ListTile(
        title: Text(coffeeProduct.name),
        subtitle: Container(
          margin: EdgeInsets.only(top: 5.h),
          child: Text(
            coffeeProduct.price,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        leading: Image(
          image: coffeeProduct.coffeeImage,
          width: 70.0.h,
          height: 70.0.h,
        ),
        trailing: IconButton(
          icon: Icon(Icons.add),
          onPressed: onAddPressed,
          style: IconButton.styleFrom(
            backgroundColor: Colors.brown,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
      ),
    );
  }
}
