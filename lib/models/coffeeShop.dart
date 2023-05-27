import 'package:flutter/cupertino.dart';
import 'package:starbucks/models/coffee.dart';

class CoffeShop extends ChangeNotifier {
// list of products
  final List<Coffe> _shop = [
    Coffe("Cheesecake Milkshake Frappuccino Cream", "42.2", "images/1.png"),
    Coffe("Frappuccino Tenor", "45.0", "images/2.png"),
    Coffe("Iced coffee", "16.3", "images/3.png"),
    Coffe("Cafe Iced coffee Latte", "32.0", "images/4.png"),
    Coffe("Cream Milkshake Frappuccino", "25.3", "images/5.png"),
    Coffe("Iced coffee Latte Almond milk Milkshake", "56.4", "images/6.png"),
    Coffe("Coffee Unicorn Frappuccino", "19.2", "images/7.png"),
    Coffe("Espresso Latte macchiato", "12.0", "images/8.png"),
    Coffe("matcha Espresso", "8.2", "images/9.png"),
    Coffe("Cafe Cappuccino Espresso", "20.2", "images/10.png"),
  ];
//user cart
  List<Coffe> _userCart = [];

//get coffe list
  List<Coffe> get coffeshop => _shop;
// get user cart
  List<Coffe> get userCart => _userCart;
// add to user cart
  void addItemToCart(Coffe coffe) {
    _userCart.add(coffe);
    notifyListeners();
  }

// remove form user cart
  void removeItemfromCart(Coffe coffe) {
    _userCart.remove(coffe);
    notifyListeners();
  }
}
