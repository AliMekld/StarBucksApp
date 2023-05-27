import 'package:flutter/material.dart';
import 'package:starbucks/constants/compontes/defualtButton.dart';
import 'package:starbucks/constants/compontes/headerOneText.dart';
import 'package:starbucks/constants/constanst/colors.dart';
import 'package:starbucks/screans/home.dart';

class WelcomPage extends StatelessWidget {
  const WelcomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.mainbackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Center(),
            Image(
              height: 250,
              width: MediaQuery.of(context).size.width * 1.2,
              image: const AssetImage(
                'images/logo.png',
              ),
            ),
            const HeaderOneText(
              text: "StarBucks",
              textSize: 45,
              textColor: AppColor.backgroundColor,
            ),
            const SizedBox(
              height: 20,
            ),
            HeaderOneText(
                text: "How do you like your coffee . .",
                textSize: 16,
                textColor: AppColor.speciaColor.withOpacity(0.4)),
            DefualtButton(
                btnText: "Enter the Shop",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (constex) => const Home()));
                }),
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: HeaderOneText(
                  text: " Origenal Taste Sence 1971",
                  textSize: 12,
                  textColor: AppColor.speciaColor.withOpacity(0.4)),
            ),
          ],
        ),
      ),
    );
  }
}
