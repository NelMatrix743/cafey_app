import "package:flutter/material.dart";

import "package:provider/provider.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "package:cafey_app/components/info_header.dart";
import "package:cafey_app/components/cart_coffee_tile.dart";
import "package:cafey_app/components/cafey_pay_button.dart";

import "package:cafey_app/models/coffee.dart";
import "package:cafey_app/models/user_info.dart";

class CartSection extends StatelessWidget {
  const CartSection({super.key});

  void removeThisCoffeeCompletelyFromCart(
    UserInformation userInfo,
    Coffee selectedCoffee,
  ) {
    int numberOfCups = userInfo.removeItemFromCartCompletely(selectedCoffee);
    double totalPriceToDeduct =
        double.parse(selectedCoffee.price) * numberOfCups;
    userInfo.removeCoffee(totalPriceToDeduct, numberOfCups);
  }

  void paymentButtonCallBack(BuildContext context) {
    final size = MediaQuery.of(context).size;
    debugPrint(size.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInformation>(
      builder: (context, userInfo, child) => SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.0.w, 20.0.h, 15.0.w, 10.0.h),
          child: Column(
            children: [
              InformationHeader(),
              SizedBox(height: 30.h),
              // ListBuilder,
              Expanded(
                child: userInfo.getUserCartContents.isEmpty
                    ? Center(
                        child: Text(
                          "Your cart is empty",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    : ListView.separated(
                        itemCount: userInfo.getUserCartContents.length,
                        itemBuilder: (context, index) {
                          final entry = userInfo.getUserCartContents.entries
                              .elementAt(index);
                          final Coffee coffee = entry.key;
                          return CartContentTile(
                            selectedCoffee: coffee,
                            deleteAction: () =>
                                removeThisCoffeeCompletelyFromCart(
                                  userInfo,
                                  coffee,
                                ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 15.h),
                      ),
              ),

              Visibility(
                visible: userInfo.getUserCartContents.isNotEmpty,
                child: CafeyPayButton(
                  onTapCallBack: () => paymentButtonCallBack(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
