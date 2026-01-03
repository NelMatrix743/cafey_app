import "package:flutter/material.dart";

class InformationHeader extends StatefulWidget {
  const InformationHeader({super.key});

  @override
  State<InformationHeader> createState() => _InformationHeaderState();
}

class _InformationHeaderState extends State<InformationHeader> {
  double totalAmount = 12.5;
  double totalNumberOfCups = 5;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.brown, width: 1),
              borderRadius: BorderRadius.circular(3), // optional
            ),
            child: Text.rich(
              TextSpan(
                text: "Amount(\$): ",
                style: TextStyle(fontSize: 16, color: Colors.brown),
                children: [
                  TextSpan(
                    text: totalAmount.toString(),
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.brown, width: 1),
              borderRadius: BorderRadius.circular(3), // optional
            ),
            child: Text.rich(
              TextSpan(
                text: "Total Cups: ",
                style: TextStyle(fontSize: 16, color: Colors.brown),
                children: [
                  TextSpan(
                    text: totalNumberOfCups.toString(),
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
