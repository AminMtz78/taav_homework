import 'restaurant_item.dart';

class Drink extends RestaurantItem {
  int drinkCount;

  Drink(
    this.drinkCount,
    super.name,
    super.description,
    super.price,
  );

  @override
  String toString() {
    return 'Drink{drinkCount: $drinkCount}';
  }
}
