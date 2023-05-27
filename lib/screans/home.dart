import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starbucks/constants/compontes/my_bottom_nav.dart';
import 'package:starbucks/models/coffeeShop.dart';
import 'package:starbucks/screans/cart.dart';
import 'package:starbucks/screans/products.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  void navigateIntoPages(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> pages = [
    const Products(),
    const CartScrean(),
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CoffeShop(),
      builder: (context, child) {
        return Scaffold(
            body: pages[_currentIndex],
            bottomNavigationBar: MyBottomNav(
              currentIndex: _currentIndex,
              ontap: ((index) => navigateIntoPages(index)),
            ));
      },
    );
  }
}
