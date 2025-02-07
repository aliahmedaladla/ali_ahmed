import 'package:flutter/material.dart';

class AppTheme {
  ///colors
  static const Color primaryColor = Color(0xFFDC6465);

  static MaterialColor primarySwatch = MaterialColor(Color(0xFFDC6465).value, {
    50: const Color(0xFFDC6465).withOpacity(.05),
    100: const Color(0xFFDC6465).withOpacity(.1),
    200: const Color(0xFFDC6465).withOpacity(.2),
    300: const Color(0xFFDC6465).withOpacity(.3),
    400: const Color(0xFFDC6465).withOpacity(.4),
    500: const Color(0xFFDC6465).withOpacity(.5),
    600: const Color(0xFFDC6465).withOpacity(.6),
    700: const Color(0xFFDC6465).withOpacity(.7),
    800: const Color(0xFFDC6465).withOpacity(.8),
    900: const Color(0xFFDC6465).withOpacity(.9)
  });

  static const Color secondaryColor = Color(0xFFFFFFFF);
  static MaterialColor secondarySwitch =
      MaterialColor(Color(0xFFFFFFFF).value, {
    50: const Color(0xFFFFFFFF).withOpacity(.05),
    100: const Color(0xFFFFFFFF).withOpacity(.1),
    200: const Color(0xFFFFFFFF).withOpacity(.2),
    300: const Color(0xFFFFFFFF).withOpacity(.3),
    400: const Color(0xFFFFFFFF).withOpacity(.4),
    500: const Color(0xFFFFFFFF).withOpacity(.5),
    600: const Color(0xFFFFFFFF).withOpacity(.6),
    700: const Color(0xFFFFFFFF).withOpacity(.7),
    800: const Color(0xFFFFFFFF).withOpacity(.8),
    900: const Color(0xFFFFFFFF).withOpacity(.9)
  });

  static Color scaffoldBackgroundColor = Color(0xffFFFFFF);
  static Color scaffoldBackgroundColor2 = Color(0xffF6F9FF);

  static const Color red = Color(0xFFD32F2F);
  static const Color pink = Color(0xFFC2185B);
  static const Color purple = Color(0xFF7B1FA2);
  static const Color deepPurple = Color(0xFF512DA8);
  static const Color indigo = Color(0xFF303F9F);
  static const Color blue = Color(0xFF1976D2);
  static const Color lightBlue = Color(0xFF0288D1);
  static const Color cyan = Color(0xFF0097A7);
  static const Color teal = Color(0xFF00796B);
  static const Color green = Color(0xFF388E3C);
  static const Color lightGreen = Color(0xFF689F38);
  static const Color lime = Color(0xFFAFB42B);
  static const Color yellow = Color(0xFFFBC02D);
  static const Color amber = Color(0xFFFFA000);
  static const Color orange = Color(0xFFF57C00);
  static const Color deepOrange = Color(0xFFE64A19);
  static const Color brown = Color(0xFF5D4037);
  static const Color grey = Color(0xFF616161);
  static const Color blueGrey = Color(0xFF455A64);

  // Neutral Colors
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  static String fontFamily = 'Alhurra';

  static TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 18.0,
      fontFamily: fontFamily,
      color: Colors.brown,
    ),
    displayMedium:
        TextStyle(fontSize: 16.0, fontFamily: fontFamily, color: Colors.brown),
    displaySmall:
        TextStyle(fontSize: 14, fontFamily: fontFamily, color: Colors.brown),
    headlineMedium: TextStyle(
        fontSize: 14, fontFamily: fontFamily, color: AppTheme.primaryColor),
    headlineSmall:
        TextStyle(fontSize: 12.0, fontFamily: fontFamily, color: Colors.brown),
    titleLarge: TextStyle(
        fontSize: 12.0, fontFamily: fontFamily, color: AppTheme.primaryColor),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      fontFamily: fontFamily,
      color: Colors.white,
    ),
    bodyMedium:
        TextStyle(fontSize: 20.0, fontFamily: fontFamily, color: Colors.white),
  );
}
