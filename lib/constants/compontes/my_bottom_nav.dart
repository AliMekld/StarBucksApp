import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:starbucks/constants/constanst/colors.dart';

// ignore: must_be_immutable
class MyBottomNav extends StatelessWidget {
  MyBottomNav({super.key, required this.currentIndex, required this.ontap});
  final int currentIndex;
  void Function(int)? ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GNav(
          tabBackgroundColor: AppColor.buttonColor.withOpacity(0.8),
          // backgroundColor: AppColor.mainbackgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          gap: 8,
          onTabChange: ((value) => ontap!(value)),
          tabBorderRadius: 12,
          color: Colors.grey[400],
          selectedIndex: currentIndex,
          mainAxisAlignment: MainAxisAlignment.center,
          activeColor: AppColor.mainbackgroundColor,
          textSize: 26,
          tabs: const [
            GButton(
              text: "Shop",
              icon: Icons.home,
            ),
            GButton(
              icon: Icons.payment,
              text: "Cart",
            )
          ]),
    );
  }
}
