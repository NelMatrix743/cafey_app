import "package:flutter/material.dart";

class InfoBox extends StatelessWidget {
  final String infoType;
  final String value;

  const InfoBox({super.key, required this.infoType, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.brown, width: 1),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text.rich(
        TextSpan(
          text: infoType,
          style: const TextStyle(fontSize: 16, color: Colors.brown),
          children: [
            TextSpan(
              text: value,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
