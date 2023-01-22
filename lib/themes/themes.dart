// ****************************
// ******** THEMES ************
// ****************************
import 'package:flutter/material.dart';


class Apptheme {

  static Color primary = const Color.fromARGB(255, 75, 170, 86);
  static Color primaryDark = const Color.fromARGB(255, 38, 105, 46);
  static Color primaryMediumClear = const Color.fromARGB(255, 75, 170, 86).withOpacity(0.7);
  static Color primaryClear = const Color.fromARGB(255, 75, 170, 86).withOpacity(0.15);
  static Color primaryWhite = const Color.fromARGB(255, 191, 253, 198).withOpacity(0.2);
  static Color secondary = Colors.grey;
  static Color secondaryDark = const Color.fromARGB(255, 88, 88, 88);
  static Color black = const Color.fromARGB(221, 24, 24, 24);
  static Color white = const Color.fromARGB(255, 247, 247, 247);
  static Color amber = Colors.amber;
  static Color amberDark = const Color.fromARGB(255, 228, 171, 1);
  static Color amberClear = Colors.amber.withOpacity(0.15);
  static Color red = const Color.fromARGB(255, 253, 113, 113);
  static Color redDark = const Color.fromARGB(255, 239, 92, 92);
  static Color blue = const Color.fromARGB(255, 48, 160, 251);
  static String montserrat = 'Montserrat';
  static double small = 12;
  static double mediumSmall = 13;
  static double medium = 13;
  static double mediumLarge = 15;
  static double largeButton = 17;
  static double large = 20;
  static double xl = 22;

  static final ThemeData lightTheme = ThemeData.light().copyWith(

     primaryColor: primary,
     appBarTheme: AppBarTheme(
       color: primary,
       titleTextStyle: TextStyle(fontFamily: montserrat),
       )
  );

   static final TextStyle textPrimarySmall = TextStyle(
    fontFamily: montserrat, color: primary, fontSize: small, fontWeight: FontWeight.w600
  );
  
  static final TextStyle textSecondarySmall = TextStyle(
    fontFamily: montserrat, color: secondary, fontSize: small, fontWeight: FontWeight.w600
  );

  static final TextStyle textBlackSmall = TextStyle(
    fontFamily: montserrat, color: black, fontSize: mediumSmall, fontWeight: FontWeight.w600
  );

  static final TextStyle textAmberSmall = TextStyle(
    fontFamily: montserrat, color: amberDark, fontSize: small, fontWeight: FontWeight.w600
  );

  static final TextStyle textRedSmall = TextStyle(
    fontFamily: montserrat, color: red, fontSize: small, fontWeight: FontWeight.w600
  );

   static final TextStyle textPrimaryMedium = TextStyle(
    fontFamily: montserrat, color: black, fontSize: medium, fontWeight: FontWeight.w600
  );

  static final TextStyle textGreenMedium = TextStyle(
    fontFamily: montserrat, color: primary, fontSize: medium, fontWeight: FontWeight.w600
  );

  static final TextStyle textPrimaryMediumLight = TextStyle(
    fontFamily: montserrat, color: primary, fontSize: mediumLarge, fontWeight: FontWeight.w400
  );

  static final TextStyle textAmberMedium = TextStyle(
    fontFamily: montserrat, color: amberDark, fontSize: medium, fontWeight: FontWeight.w600
  );

  static final TextStyle textRedMedium = TextStyle(
    fontFamily: montserrat, color: redDark, fontSize: medium, fontWeight: FontWeight.w600
  );

   static final TextStyle textSecondaryMedium = TextStyle(
    fontFamily: montserrat, color: secondary, fontSize: medium, fontWeight: FontWeight.w500
  );

  static final TextStyle textSecondaryMediumLarge = TextStyle(
    fontFamily: montserrat, color: secondary, fontSize: mediumLarge, fontWeight: FontWeight.w500
  );

  static final TextStyle textWhiteMedium = TextStyle(
    fontFamily: montserrat, color: white, fontSize: medium, fontWeight: FontWeight.w500
  );

  static final TextStyle textWhiteMediumLarge = TextStyle(
    fontFamily: montserrat, color: white, fontSize: mediumLarge, fontWeight: FontWeight.w500
  );

  static final TextStyle textPrimaryDarkLargeButton = TextStyle(
    fontFamily: montserrat, color: primaryDark, fontSize: largeButton, fontWeight: FontWeight.w500
  );

  static final TextStyle textWhiteLarge = TextStyle(
    fontFamily: montserrat, color: white, fontSize: large, fontWeight: FontWeight.w500
  );

  static final TextStyle textBlackMediumLarge = TextStyle(
    fontFamily: montserrat, color: black, fontSize: mediumLarge, fontWeight: FontWeight.w600
  );

   static final TextStyle textPrimaryMediumLarge = TextStyle(
    fontFamily: montserrat, color: primary, fontSize: mediumLarge, fontWeight: FontWeight.w600
  );

  static final TextStyle textPrimaryLargeButton = TextStyle(
    fontFamily: montserrat, color: primary, fontSize: largeButton, fontWeight: FontWeight.w500
  );

  static final TextStyle textBlackLargeButton = TextStyle(
    fontFamily: montserrat, color: secondaryDark, fontSize: largeButton, fontWeight: FontWeight.w500
  );

  static final TextStyle textPrimaryLarge = TextStyle(
    fontFamily: montserrat, color: primary, fontSize: large, fontWeight: FontWeight.w600
  );

  static final TextStyle textPrimaryXL = TextStyle(
    fontFamily: montserrat, color: secondaryDark, fontSize: xl, fontWeight: FontWeight.w700
  );

  static final TextStyle textSecondaryLarge = TextStyle(
    fontFamily: montserrat, color: secondary, fontSize: large, fontWeight: FontWeight.w600
  );

  static final TextStyle textBlackLarge = TextStyle(
    fontFamily: montserrat, color: secondaryDark, fontSize: large, fontWeight: FontWeight.w500
  );

  static final TextStyle textAmberMediumLarge = TextStyle(
    fontFamily: montserrat, color: amberDark, fontSize: mediumLarge, fontWeight: FontWeight.w600
  );

  static final TextStyle textSecondaryMediumLargeButton = TextStyle(
    fontFamily: montserrat, color: secondary, fontSize: largeButton, fontWeight: FontWeight.w500
  );

  static final TextStyle textRedMediumLargeButton = TextStyle(
    fontFamily: montserrat, color: red, fontSize: mediumLarge, fontWeight: FontWeight.w500
  );

  static final TextStyle textWhiteLargeButton = TextStyle(
    fontFamily: montserrat, color: white, fontSize: largeButton, fontWeight: FontWeight.w600
  );

  static final TextStyle textRedLargeButton = TextStyle(
    fontFamily: montserrat, color: red, fontSize: largeButton, fontWeight: FontWeight.w600
  );

 
}