import 'dart:convert';
import 'dart:io';
import 'dart:js_interop';
import 'customer.dart';
import 'order.dart';
import 'restaurant_item.dart';
import 'drink.dart';

import 'menu.dart';

class Restaurant {
  Menu restaurantMenu;

  Restaurant(this.restaurantMenu);

  final List<Customer> _customers = [];
  List<Order> reservedOrders = [];
  final List<Order> _finishOrders = [];

  Order addNewOrder({required String customerPhoneNumber, required int orderId}) {
    Order newOrder = Order(customerPhoneNumber, orderId,);
    return newOrder;
  }

  void addToReservedOrders(
      {required int orderId,
      required String phoneNumber,
      required String customerName,
      required String itemName}) {
    int orderIndex =
        reservedOrders.indexWhere((element) => element.id == orderId);
    if (orderIndex == -1) {
      Order newOrder =
          addNewOrder(customerPhoneNumber: phoneNumber, orderId: orderId);
      List<RestaurantItem> availableItems = restaurantMenu.menu;
      RestaurantItem itemChoose =
          availableItems.firstWhere((element) => element.name == itemName);

      newOrder.addItemToCustomerOrder(newItem: itemChoose);
      reservedOrders.add(newOrder);
    } else {
      int orderIndex =
          reservedOrders.indexWhere((element) => element.id == orderId);
      List<RestaurantItem> availableItems = restaurantMenu.menu;
      RestaurantItem itemChoose =
          availableItems.firstWhere((element) => element.name == itemName);
      reservedOrders[orderIndex].addItemToCustomerOrder(newItem: itemChoose);
      if (itemChoose is Drink){
        itemChoose.drinkCount --;
      }
    }
  }

  void deleteItemFromReservedOrder({required int orderId, required String itemName}){
    List<RestaurantItem> availableItems = restaurantMenu.menu;
    RestaurantItem deletingItem = availableItems.firstWhere((element) => element.name == itemName);
    int orderIndex = reservedOrders.indexWhere((element) => element.id == orderId);
    reservedOrders[orderIndex].deleteItemFromCustomerOrder(Item: deletingItem);
  }

  void registerOrder({required int orderId, required String time}){
    int orderIndex = reservedOrders.indexWhere((element) => element.id == orderId);
    reservedOrders[orderIndex].registeringOrder();
    Order order = reservedOrders[orderIndex];
    order.calculateOrderCost();
    order.time = time;
    _finishOrders.add(order);
    reservedOrders.removeAt(orderIndex);

  }
}

//
// for (RestaurantItem item in availableItems) {
// if (itemName == item.name) {
// RestaurantItem currentItem =
// availableItems.firstWhere((element) => element.name == itemName);
// newOrder.addItemToCustomerOrder(newItem: currentItem);
// if (currentItem.runtimeType == Drink){
//
// }
// }
// }
