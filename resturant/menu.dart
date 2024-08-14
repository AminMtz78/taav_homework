import 'dart:convert';

import 'restaurant_item.dart';
import 'drink.dart';
import 'food.dart';
class Menu {
  final List<RestaurantItem> menu = [];

  void addDrinkToMenu({
    required String name,
    required String description,
    required int drinkCount,
    required double price,
  }) {
    Drink newDrink = Drink(drinkCount, name, description, price);
    menu.add(newDrink);
  }

  void addFoodToMenu({
    required String name,
    required String description,
    required double price,
  }) {
    Food newFood = Food(name, description, price);
    menu.add(newFood);
  }

  void deleteFood({required String foodName}){
    int index = menu.indexWhere((element) => element.name == foodName);
    menu.removeAt(index);
  }

  void deleteDrink({required String foodName}) {
    int index = menu.indexWhere((element) => element.name == foodName);
    menu.removeAt(index);
  }

  void showMenu(){
   print(menu);
  }

  @override
  String toString() {
    return 'Menu{_menu: $menu}';
  }

  List<RestaurantItem> getMenu(){
    return menu;
  }
}
