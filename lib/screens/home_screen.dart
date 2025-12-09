import "package:cafey_app/components/bottom_nav_bar.dart";
import "package:cafey_app/utils/const_properties.dart";
import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      bottomNavigationBar: CafeyBottomNavBar(),
    );
  }
}
