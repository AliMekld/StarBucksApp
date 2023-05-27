import 'package:flutter/material.dart';
import 'package:starbucks/constants/compontes/defualtButton.dart';
import 'package:starbucks/constants/compontes/headerOneText.dart';
import 'package:starbucks/constants/constanst/colors.dart';

// لسه ماضفتش اللوجيك للاسكرينه !!!
//need to learn multi provider
class ProductDetails extends StatefulWidget {
  const ProductDetails(
      {super.key,
      required this.image,
      required this.heroTag,
      required this.name,
      required this.price});
  final String? image;
  final String? name;
  final String? price;
  final String heroTag;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<bool> selectedSize = <bool>[true, false, false];
  List<Widget> sizes = const <Widget>[Text("S"), Text("M"), Text("L")];
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.52,
              width: double.infinity,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "${widget.image}",
                        ),
                        fit: BoxFit.contain)),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.41,
                decoration: const BoxDecoration(
                    color: AppColor.containerColor,
                    boxShadow: [
                      BoxShadow(
                          color: AppColor.buttonColor,
                          blurRadius: 0.5,
                          spreadRadius: 0.5,
                          offset: Offset(0, 1))
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        const HeaderOneText(
                          text: "- Quantity -",
                          textSize: 22,
                          textColor: AppColor.mainbackgroundColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    counter--;
                                  });
                                },
                                child: const Icon(Icons.remove,
                                    color: AppColor.mainbackgroundColor)),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Center(
                                child: HeaderOneText(
                                  text: "$counter",
                                  textSize: 16,
                                  textColor: AppColor.speciaColor,
                                ),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    counter++;
                                  });
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: AppColor.mainbackgroundColor,
                                ))
                          ],
                        ),
                        const HeaderOneText(
                          text: "- Size -",
                          textSize: 22,
                          textColor: AppColor.mainbackgroundColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ToggleButtons(
                            onPressed: ((int index) {
                              setState(() {
                                for (int i = 0; i < selectedSize.length; i++) {
                                  selectedSize[i] = i == index;
                                }
                              });
                            }),
                            isSelected: selectedSize,
                            children: sizes),
                        DefualtButton(
                            btnText: "Order Now",
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: HeaderOneText(
                    text: "${widget.name}",
                    textSize: 22,
                    textColor: AppColor.backgroundColor,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
