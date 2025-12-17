import 'package:cafey_app/models/user_cart.dart';
import 'package:cafey_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const CafeyApp());
}

class CafeyApp extends StatelessWidget {
  const CafeyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserCart(),
      builder: (context, child) => MaterialApp(
        title: "Cafey App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Consolas"),
        home: HomeScreen(),
      ),
    );
  }
}
