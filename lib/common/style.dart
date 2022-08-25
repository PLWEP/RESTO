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
  headline5: GoogleFonts.robotoSlab(fontSize: 30, fontWeight: FontWeight.w500),
  subtitle1: GoogleFonts.robotoSerif(fontSize: 13, fontWeight: FontWeight.w300),
  bodyText1: GoogleFonts.robotoFlex(fontSize: 15),
  bodyText2: GoogleFonts.rubikBubbles(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.rubikBubbles(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.rubikBubbles(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.rubikBubbles(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
