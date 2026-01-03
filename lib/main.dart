import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import "package:flutter/rendering.dart";

import 'package:cafey_app/models/user_cart.dart';
import 'package:cafey_app/models/user_balance.dart';
import 'package:cafey_app/screens/home_screen.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(const CafeyApp());
}

class CafeyApp extends StatelessWidget {
  const CafeyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserCart()),
        ChangeNotifierProvider(create: (context) => UserBalance()),
      ],
      child: MaterialApp(
        title: "Cafey App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Consolas"),
        home: HomeScreen(),
      ),
    );
  }
}
