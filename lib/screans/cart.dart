import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starbucks/constants/compontes/defualtButton.dart';
import 'package:starbucks/constants/compontes/headerOneText.dart';
import 'package:starbucks/constants/constanst/colors.dart';
import 'package:starbucks/models/coffeeShop.dart';
import 'package:starbucks/screans/productDetails.dart';

import '../constants/compontes/coffeTile.dart';
import '../models/coffee.dart';

class CartScrean extends StatefulWidget {
  const CartScrean({super.key, required this.quantity});
  final int quantity;

  @override
  State<CartScrean> createState() => _CartScreanState();
}

class _CartScreanState extends State<CartScrean> {
  void removeFromCart(Coffe coffe) {
    Provider.of<CoffeShop>(context, listen: false).removeItemfromCart(coffe);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeShop>(builder: (context, value, child) {
      double totalPrice = 0;
      double calculateTotalPrice() {
        if (value.userCart.isNotEmpty) {
          for (int i = 0; i < value.userCart.length; i++) {
            totalPrice = totalPrice + double.parse(value.userCart[i].price);
          }
        }
        return totalPrice;
      }

      double s = calculateTotalPrice();

      //

      int currentIndex = 0;
      return SafeArea(
          child: Scaffold(
        backgroundColor: AppColor.mainbackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
              child: HeaderOneText(
                  text: "enjoy your order",
                  textSize: 22,
                  textColor: AppColor.buttonColor),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  Coffe eachCoffe = value.userCart[index];
                  return coffeeTile(
                    oncontainerPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductDetails(
                                image: eachCoffe.imagePath,
                                heroTag: eachCoffe.name,
                                name: eachCoffe.name,
                                price: eachCoffe.price,
                              )));
                    },
                    hertag: eachCoffe.name,
                    trailingicon: Icons.delete,
                    eachCoffe: eachCoffe,
                    onpressed: () => removeFromCart(eachCoffe),
                  );
                },
                itemCount: value.userCart.length,
              ),
            ),
            if (value.userCart.isNotEmpty)
              DefualtButton(
                  btnText:
                      "Pay Know !                               ${s.floor()} \$  ",
                  onPressed: () {
                    //select your payment methods
                  })
          ],
        ),
      ));
    });
  }
}
