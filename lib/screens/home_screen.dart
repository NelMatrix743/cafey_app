import "package:flutter/material.dart";

import "package:cafey_app/components/bottom_nav_bar.dart";

import "package:cafey_app/utils/const_properties.dart";

import "package:cafey_app/screens/sections/shopping_section.dart";
import "package:cafey_app/screens/sections/cart_section.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreenIndex = 0;

  static final List<Widget> _homeScreenSections = <Widget>[
    ShoppingSection(),
    CartSection(),
  ];

  void selectSectionDestination(int selectIndex) {
    setState(() {
      _selectedScreenIndex = selectIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      bottomNavigationBar: CafeyBottomNavBar(
        selectedSectionIndex: _selectedScreenIndex,
        onDestinationSelectedCallBack: selectSectionDestination,
      ),
      body: _homeScreenSections[_selectedScreenIndex],
    );
  }
}
