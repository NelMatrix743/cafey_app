import 'package:cafey_app/screens/home_screen.dart';
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
      theme: ThemeData(fontFamily: "Consolas"),
      home: HomeScreen(),
    );
  }
}
