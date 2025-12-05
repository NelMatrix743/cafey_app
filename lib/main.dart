import 'package:flutter/material.dart';

void main() {
  runApp(const CafeyApp());
}

class CafeyApp extends StatelessWidget {
  const CafeyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cafey App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SafeArea(child: Text("CAFEY APP"))),
    );
  }
}
