import "package:flutter/material.dart";

import "package:provider/provider.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

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
        extentRatio: 0.4.w,
        children: <Widget>[
          CustomSlidableAction(
            onPressed: ((context) => deleteAction()),
            foregroundColor: Colors.white,
            backgroundColor: Colors.brown,
            borderRadius: BorderRadius.circular(12.r),
            child: ImageIcon(deleteTileFilledIcon, size: 25.h),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.all(Radius.circular(12.0.r)),
        ),
        padding: EdgeInsets.only(top: 30.0.h, bottom: 27.0.h),
        child: ListTile(
          title: Text(selectedCoffee.name),
          subtitle: Container(
            margin: EdgeInsets.only(top: 5.h),
            child: Text(
              selectedCoffee.price,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          leading: Image(
            image: selectedCoffee.coffeeImage,
            width: 70.0.h,
            height: 70.0.h,
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
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.brown, width: 2.w),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  numberOfCups.toString(),
                  style: TextStyle(fontSize: 15.sp),
                ),
              ),
              SizedBox(width: 8.w),
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
