import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static const String defaultFontFamily = 'Poppins';

  static TextStyle poppins({
    required BuildContext context,
    required double fontSize,
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? Theme.of(context).textTheme.bodyMedium!.color,
    );
  }

  static TextStyle inter({
    required BuildContext context,
    required double fontSize,
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? Theme.of(context).textTheme.bodyMedium!.color,
    );
  }

  static TextStyle montserrat({
    required BuildContext context,
    required double fontSize,
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
  }) {
    return GoogleFonts.montserrat(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? Theme.of(context).textTheme.bodyMedium!.color,
    );
  }
}

FontWeight thin = FontWeight.w100;
FontWeight extraLight = FontWeight.w200;
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;
