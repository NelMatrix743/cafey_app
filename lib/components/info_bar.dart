import "package:flutter/material.dart";

import "package:cafey_app/components/info_box.dart";
import "package:cafey_app/utils/strings.dart";

class InformationHeader extends StatefulWidget {
  const InformationHeader({super.key});

  @override
  State<InformationHeader> createState() => _InformationHeaderState();
}

class _InformationHeaderState extends State<InformationHeader> {
  double totalAmount = 12.5;
  int totalNumberOfCups = 5;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InfoBox(
            infoType: totalAmountInfoLabel,
            value: totalAmount.toString(),
          ),
          InfoBox(
            infoType: totalNumberOfCupsLabel,
            value: totalNumberOfCups.toString(),
          ),
        ],
      ),
    );
  }
}
