import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0x00ff9551);
const Color secondaryColor = Color(0x006fedd6);

final TextTheme appTextTheme = TextTheme(
  headline1: GoogleFonts.roboto(
      fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
  headline2: GoogleFonts.robotoMono(fontSize: 20),
  headline3: GoogleFonts.robotoSlab(fontSize: 18, fontWeight: FontWeight.w500),
  headline4: GoogleFonts.robotoSerif(fontSize: 15),
  headline5: GoogleFonts.notoSans(fontSize: 23, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.notoSans(
      fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.notoSans(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.notoSans(
      fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.rubikBubbles(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.rubikBubbles(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.rubikBubbles(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.rubikBubbles(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.rubikBubbles(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
