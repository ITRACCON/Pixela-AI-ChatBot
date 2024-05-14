import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextAlign textAlign;
  const AppText(
      {required this.text,
      required this.textStyle,
      this.textAlign = TextAlign.center,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        overflow: TextOverflow.ellipsis,
        maxLines: 1000,
        style: GoogleFonts.montserrat(
          textStyle: textStyle,
        ));
  }
}

class AppHistoryText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  const AppHistoryText(
      {required this.text, required this.textStyle, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        maxLines: 6,
        style: GoogleFonts.montserrat(
          textStyle: textStyle,
        ));
  }
}
