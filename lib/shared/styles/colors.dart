import 'package:flutter/material.dart';

class AppColors {
  static MaterialColor mainColor = const MaterialColor(0xFF7F57F1, <int, Color>{
    50: Color(0xFFE6D5FF),
    100: Color(0xFFC0A6FF),
    200: Color(0xFF996BFF),
    300: Color(0xFF7F57F1),
    400: Color(0xFF6B4EE1),
    500: Color(0xFF5C44D6), // This is the primary color (500)
    600: Color(0xFF4E3BBB),
    700: Color(0xFF4333A3),
    800: Color(0xFF392A8A),
    900: Color(0xFF2C1F6A),
  });
  static Color? grey = Colors.grey[120];
  static Color backgroundColor = const Color(0xffF8F8F8);
  static Color purpleGrey = const Color(0xff939196);
  static Color blackGrey = const Color(0xffEBEBEB);
  static LinearGradient customGradient = LinearGradient(
    colors: [
      mainColor[200]!, // Start color (you can choose any color from your mainColor)
      mainColor[900]!, // End color (you can choose any color from your mainColor)
    ],
    begin: Alignment.centerLeft, // Define the gradient's starting point
    end: Alignment.centerRight, // Define the gradient's ending point
  );
}


const kSecondaryColor = Color(0xFF8B94BC);
const kGreenColor = Color(0xFF6AC259);
const kRedColor = Color(0xFFE92E30);
const kGrayColor = Color(0xFFC1C1C1);
const kBlackColor = Color(0xFF101010);
const kPrimaryGradient = LinearGradient(
  colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const double kDefaultPadding = 20.0;
