import "package:cafey_app/utils/const_properties.dart";
import "package:cafey_app/utils/image_assets.dart";
import "package:flutter/material.dart";

class CafeyBottomNavBar extends StatelessWidget {
  final int selectedSectionIndex;
  final void Function(int) onDestinationSelectedCallBack;
  const CafeyBottomNavBar({
    super.key,
    required this.selectedSectionIndex,
    required this.onDestinationSelectedCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      indicatorColor: mainBackgroundColor,
      selectedIndex: selectedSectionIndex,
      onDestinationSelected: onDestinationSelectedCallBack,
      destinations: const <Widget>[
        NavigationDestination(
          icon: ImageIcon(coffeeShopOutlinedIcon),
          selectedIcon: ImageIcon(coffeeShopFilledIcon, color: Colors.brown),
          label: "Shop",
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
