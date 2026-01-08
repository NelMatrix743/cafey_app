import "package:flutter/material.dart";

import "package:provider/provider.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "package:cafey_app/components/info_box.dart";

import "package:cafey_app/models/user_info.dart";

import "package:cafey_app/utils/strings.dart";

class InformationHeader extends StatelessWidget {
  const InformationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInformation>(
      builder: (context, userInfo, child) => Container(
        padding: EdgeInsets.only(top: 12.0.h, bottom: 12.0.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InfoBox(
              infoType: totalAmountInfoLabel,
              value: userInfo.totalAmountToPay.toString(),
            ),
            InfoBox(
              infoType: totalNumberOfCupsLabel,
              value: userInfo.totalNumberOfCoffeeCups.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
