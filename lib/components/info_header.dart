import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "package:cafey_app/components/info_box.dart";
import "package:cafey_app/utils/strings.dart";
import "package:cafey_app/models/user_balance.dart";

class InformationHeader extends StatelessWidget {
  const InformationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserBalance>(
      builder: (context, balance, child) => Container(
        padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InfoBox(
              infoType: totalAmountInfoLabel,
              value: balance.totalAmountToPay.toString(),
            ),
            InfoBox(
              infoType: totalNumberOfCupsLabel,
              value: balance.totalNumberOfCoffeeCups.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
