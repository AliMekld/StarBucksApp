import 'package:flutter/material.dart';
import 'package:starbucks/models/coffeeShop.dart';
import 'package:starbucks/screans/productDetails.dart';

import '../../models/coffee.dart';
import '../constanst/colors.dart';
import 'headerOneText.dart';

// ignore: camel_case_types, must_be_immutable
class coffeeTile extends StatelessWidget {
  coffeeTile(
      {Key? key,
      required this.eachCoffe,
      required this.hertag,
      required this.onpressed,
      this.trailingicon,
      this.oncontainerPressed})
      : super(key: key);
  void Function()? onpressed;
  void Function()? oncontainerPressed;
  final int counter = 1;

  final Coffe eachCoffe;
  final String hertag;
  IconData? trailingicon = Icons.add;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: oncontainerPressed,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 1, spreadRadius: 1, color: Colors.grey.shade300)
          ],
          borderRadius: BorderRadius.circular(20),
          border: const Border.fromBorderSide(BorderSide.none),
          color: Colors.white,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Hero(
                  tag: eachCoffe.name,
                  child: Image(
                    height: 100,
                    width: 100,
                    image: AssetImage(eachCoffe.imagePath),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderOneText(
                      text: eachCoffe.name,
                      textSize: 16,
                      textColor: AppColor.speciaColor,
                    ),
                    HeaderOneText(
                      text: eachCoffe.price,
                      textSize: 14,
                      textColor: Colors.green,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  child: Icon(
                    trailingicon,
                    size: 18,
                  ),
                  onPressed: () => onpressed!(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
