import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starbucks/constants/compontes/headerOneText.dart';
import 'package:starbucks/constants/constanst/colors.dart';
import 'package:starbucks/models/coffee.dart';
import 'package:starbucks/models/coffeeShop.dart';
import 'package:starbucks/screans/productDetails.dart';
import '../constants/compontes/coffeTile.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    // add to cart
    void addToCart(Coffe coffe) {
      Provider.of<CoffeShop>(context, listen: false).addItemToCart(coffe);
    }

    return Consumer<CoffeShop>(builder: (context, value, child) {
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
                  text: "How Would you like your coffe !",
                  textSize: 22,
                  textColor: AppColor.buttonColor),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  Coffe eachCoffe = value.coffeshop[index];

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
                    trailingicon: Icons.add,
                    eachCoffe: eachCoffe,
                    onpressed: () => addToCart(eachCoffe),
                  );
                },
                itemCount: value.coffeshop.length,
              ),
            )
          ],
        ),
      ));
    });
  }
}


/*
  Expanded(
                child: CarouselSlider.builder(
              itemBuilder: (BuildContext context, int index, int realIndex) {
                Coffe eachCoffe = value.coffeshop[index];
                return Center(
                  child: Container(
                    color: Colors.amber,
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Stack(children: [
                        Align(
                          child: Image(
                            image: AssetImage(
                              eachCoffe.imagePath,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: HeaderOneText(
                            text: eachCoffe.name,
                            textSize: 16,
                            textColor: AppColor.speciaColor,
                          ),
                        )
                      ]),
                    ),
                  ),
                );
              },
              itemCount: value.coffeshop.length,
              options: CarouselOptions(
                  disableCenter: false,
                  enlargeCenterPage: true,
                  padEnds: true,
                  animateToClosest: true,
                  autoPlayCurve: Curves.easeInCubic,
                  autoPlay: true,
                  height: MediaQuery.of(context).size.height,
                  scrollDirection: Axis.horizontal,
                  aspectRatio: 16 / 4),
            ))
          
*/
