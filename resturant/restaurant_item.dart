abstract class RestaurantItem{
  String name;
  String description;
  double price;

  RestaurantItem(this.name, this.description, this.price);

  @override
  String toString() {
    return 'RestaurantItem{name: $name, description: $description, price: $price}';
  }
}