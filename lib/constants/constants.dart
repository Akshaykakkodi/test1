import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstants {
  static String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjBiZmUxODE3ZmYzZjBkMmZjMmQwNGUiLCJpYXQiOjE3MTQ3MTkyMDMsImV4cCI6MTc4MzgzOTIwM30.HfsYDcVEzMsdi6pU24IzHzmGAxfDQ2NAJYIptOAu_9I";

  static String apiEndpoint = "https://rubidya.com/api/users/get-media";
  static Color textBlue = const Color(0xff1E3167);
  static Color textGrey = const Color(0xffA7ACD0);
  static Color buttonBlue = const Color(0xff184AC0);
  static Color buttonDarkBlue = const Color(0xff28426B);

  static TextStyle textLarge = GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500, color: textBlue));

  static TextStyle textMedium = GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: textBlue));
  static TextStyle textMediumGrey = GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: textBlue.withOpacity(0.6)));
}
