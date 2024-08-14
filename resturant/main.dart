import 'restaurant_item.dart';
import 'restaurant.dart';
import 'menu.dart';
import 'order.dart';
import 'customer.dart';



void main(){
  Menu aminMenu = Menu();
  Restaurant amin = Restaurant(aminMenu);

  aminMenu.addDrinkToMenu(name: 'coca', description: 'sljdflbjasd', drinkCount: 10, price: 10);



}