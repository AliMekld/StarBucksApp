import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderOneText extends StatelessWidget {
  const HeaderOneText(
      {super.key,
      required this.text,
      required this.textSize,
      required this.textColor});
  final String text;
  final double textSize;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(6),
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.clip,
          textScaleFactor: 1,
          textAlign: TextAlign.start,
          style:
              GoogleFonts.playfairDisplay(color: textColor, fontSize: textSize),
        ));
  }
}
