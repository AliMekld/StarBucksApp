import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../screans/home.dart';
import '../constanst/colors.dart';
import 'headerOneText.dart';

class DefualtButton extends StatelessWidget {
  DefualtButton({super.key, required this.btnText, required this.onPressed});
  final String? btnText;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: MaterialButton(
        color: AppColor.buttonColor,
        onPressed: onPressed,
        height: 65,
        minWidth: double.infinity,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
        child: HeaderOneText(
          text: btnText!,
          textColor: AppColor.mainbackgroundColor,
          textSize: 15,
        ),
      ),
    );
  }
}
