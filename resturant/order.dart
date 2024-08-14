import 'dart:math';

import 'restaurant_item.dart';
import 'drink.dart';
import 'food.dart';
class Order{
  int id;
  String time = '';
  String customerPhoneNumber;
  double totalPrice = 0;
  bool isOrderRegister = false;
  List<RestaurantItem> customerOrders = [];

  Order(this.customerPhoneNumber, this.id,);

  void addItemToCustomerOrder({required RestaurantItem newItem }){
    if (isOrderRegister == false){
      customerOrders.add(newItem);
    }
    else{
      print('can not add because order registered');
    }

  }

  void deleteItemFromCustomerOrder({required  RestaurantItem Item}){
    if (isOrderRegister == false){
      customerOrders.removeWhere((element) => element == Item);
    }
    else {
      print('can not add because order registered');
    }

  }

  void registeringOrder(){
    isOrderRegister = true;
  }

  void calculateOrderCost(){
    for (RestaurantItem item in customerOrders){
      totalPrice += item.price;
    }
  }


}