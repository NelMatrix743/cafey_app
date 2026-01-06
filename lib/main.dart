import 'package:flutter/material.dart';
//import "package:flutter/rendering.dart";

import 'package:provider/provider.dart';

import 'package:cafey_app/models/user_info.dart';

import 'package:cafey_app/screens/home_screen.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(const CafeyApp());
}

class CafeyApp extends StatelessWidget {
  const CafeyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserInformation(),
      builder: (context, child) => MaterialApp(
        title: "Cafey App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Consolas"),
        home: HomeScreen(),
      ),
    );
  }
}
