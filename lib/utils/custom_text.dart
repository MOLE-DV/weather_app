import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  String text;
  Color? color;
  double? fontSize;
  FontWeight? fontWeight;
  TextStyle? textStyle;

  CustomText({
    super.key,
    required this.text,
    this.color = Colors.white,
    this.fontSize = 15,
    this.fontWeight,
    this.textStyle,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        textStyle: textStyle,
      ),
    );
  }
}
