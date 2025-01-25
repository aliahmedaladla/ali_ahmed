import 'package:flutter/material.dart';

class AppTheme {
  /// Colors
  static const Color primaryColor = Color(0xFFFDFAFA); // اللون الأساسي
  static const Color secondaryColor = Color(0xFFFDFAFA); // اللون الثانوي
  static const Color accentColor = Color(0xFF9C27B0); // لون التمييز
  static const Color backgroundColor = Color(0xFFEFEAEA); // لون الخلفية
  static const Color errorColor = Color(0xFFFF5252); // لون الخطأ
  static const Color successColor = Color(0xFF4CAF50); // لون النجاح
  static const Color warningColor = Color(0xFFFFC107); // لون التحذير
  static const Color infoColor = Color(0xFF2196F3); // لون المعلومات

  /// MaterialColor for primaryColor
  static MaterialColor primarySwatch = MaterialColor(0xFFDC6465, {
    50: Color(0xFFDC6465).withOpacity(.05),
    100: Color(0xFFDC6465).withOpacity(.1),
    200: Color(0xFFDC6465).withOpacity(.2),
    300: Color(0xFFDC6465).withOpacity(.3),
    400: Color(0xFFDC6465).withOpacity(.4),
    500: Color(0xFFDC6465).withOpacity(.5),
    600: Color(0xFFDC6465).withOpacity(.6),
    700: Color(0xFFDC6465).withOpacity(.7),
    800: Color(0xFFDC6465).withOpacity(.8),
    900: Color(0xFFDC6465).withOpacity(.9),
  });

  /// Secondary Switch
  static MaterialColor secondarySwitch = MaterialColor(0xFFFFFFFF, {
    50: Color(0xFFBDB2B2).withOpacity(.05),
    100: Color(0xFF573ECC).withOpacity(.1),
    200: Color(0xFFFFFFFF).withOpacity(.2),
    300: Color(0xFFFFFFFF).withOpacity(.3),
    400: Color(0xFFFFFFFF).withOpacity(.4),
    500: Color(0xFFFFFFFF).withOpacity(.5),
    600: Color(0xFFFFFFFF).withOpacity(.6),
    700: Color(0xFFFFFFFF).withOpacity(.7),
    800: Color(0xFFFFFFFF).withOpacity(.8),
    900: Color(0xFFFFFFFF).withOpacity(.9),
  });

  /// Background Colors
  static const Color scaffoldBackgroundColor = Color(0xFFFFFFFF);
  static const Color scaffoldBackgroundColor2 = Color(0xFFF6F9FF);
  static const Color cardColor = Color(0xFFE0E0E0);

  /// Font Family
  static const String fontFamily = 'Alhurra';

  /// Border Styles
  static const BorderRadius cardBorderRadius = BorderRadius.all(
    Radius.circular(15),
  );

  /// Shadows
  static const List<BoxShadow> boxShadows = [
    BoxShadow(
      color: Colors.black26,
      offset: Offset(0, 4),
      blurRadius: 10,
    ),
  ];

  /// Text Styles
  static final TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 18.0,
      fontFamily: fontFamily,
      color: Colors.brown,
    ),
    displayMedium: TextStyle(
      fontSize: 16.0,
      fontFamily: fontFamily,
      color: Colors.brown,
    ),
    displaySmall: TextStyle(
      fontSize: 14,
      fontFamily: fontFamily,
      color: Colors.brown,
    ),
    headlineMedium: TextStyle(
      fontSize: 14,
      fontFamily: fontFamily,
      color: AppTheme.primaryColor,
    ),
    headlineSmall: TextStyle(
      fontSize: 12.0,
      fontFamily: fontFamily,
      color: Colors.brown,
    ),
    titleLarge: TextStyle(
      fontSize: 12.0,
      fontFamily: fontFamily,
      color: AppTheme.primaryColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      fontFamily: fontFamily,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 20.0,
      fontFamily: fontFamily,
      color: Colors.white,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontFamily: fontFamily,
      color: Colors.grey,
    ),
  );

  /// Button Styles
  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: cardBorderRadius,
    ),
  );

  static final ButtonStyle textButtonStyle = TextButton.styleFrom(
    foregroundColor: primaryColor,
    textStyle: const TextStyle(
      fontSize: 14,
      fontFamily: fontFamily,
    ),
  );

  static final ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
    side: BorderSide(color: primaryColor, width: 1.5),
    shape: RoundedRectangleBorder(
      borderRadius: cardBorderRadius,
    ),
  );
}
