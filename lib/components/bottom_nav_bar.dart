import "package:cafey_app/utils/const_properties.dart";
import "package:cafey_app/utils/image_assets.dart";
import "package:flutter/material.dart";

class CafeyBottomNavBar extends StatelessWidget {
  const CafeyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      indicatorColor: mainBackgroundColor,

      destinations: const <Widget>[
        NavigationDestination(
          icon: ImageIcon(homeOutlinedIcon),
          selectedIcon: ImageIcon(homeFilledIcon, color: Colors.brown),
          label: "Home",
        ),
        NavigationDestination(
          icon: ImageIcon(shoppingCartOutlinedIcon),
          selectedIcon: ImageIcon(shoppingCartFilledIcon, color: Colors.brown),
          label: "Cart",
        ),
      ],
    );
  }
}
