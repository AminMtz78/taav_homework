import 'restaurant_item.dart';

class Food extends RestaurantItem {
  Food(
    super.name,
    super.description,
    super.price,
  );

  @override
  String toString() {
    return 'Food{}';
  }
}
