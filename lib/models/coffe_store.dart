import "package:cafey_app/models/coffee.dart";

import "package:cafey_app/utils/image_assets.dart";

class CoffeeStore {
  static final List<Coffee> _availableCoffeeProducts = <Coffee>[
    Coffee(
      name: "Long Black",
      price: "4.00",
      coffeeImage: longBlackSharpAssetIcon,
    ),
    Coffee(
      name: "Espresso",
      price: "3.00",
      coffeeImage: espressoSharpAssetIcon,
    ),
    Coffee(name: "Latte", price: "5.00", coffeeImage: latteSharpAssetIcon),
    Coffee(
      name: "Iced Coffee",
      price: "4.50",
      coffeeImage: icedCoffeeSharpAssetIcon,
    ),
  ];

  static List<Coffee> get getCoffeeShopProducts =>
      List.unmodifiable(_availableCoffeeProducts);
}
