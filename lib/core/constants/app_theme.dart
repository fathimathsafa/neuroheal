// Flutter Dart code for the theme
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand Colors
  static const Color primaryColor = Color(0xFF0EBE7F);
  static const Color primaryColorLight = Color(0xFF07D9AD);
  static const Color secondaryColor = Color(0xFF61CEFF);
  static const Color accentColor = Color(0xFF2753F3);
  
  // Semantic Colors
  static const Color errorColor = Color(0xFFFF0000);
  static const Color warningColor = Color(0xFFF6D060);
  static const Color successColor = Color(0xFF0EBE7F);
  
  // Neutral Colors
  static const Color textDarkColor = Color(0xFF333333);
  static const Color textMediumColor = Color(0xFF677294);
  static const Color backgroundColor = Color(0xFFF9F8F8);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color dividerColor = Color(0xFFEDEDED);
  
  // Gradient definitions
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryColor, primaryColorLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Light theme configuration
  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
      background: backgroundColor,
      surface: surfaceColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: textDarkColor,
      onSurface: textDarkColor,
    ),
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: surfaceColor,
      elevation: 0,
      iconTheme: IconThemeData(color: textMediumColor),
      titleTextStyle: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: textDarkColor,
        ),
      ),
    ),
    iconTheme: IconThemeData(color: textMediumColor),
    textTheme: GoogleFonts.rubikTextTheme().copyWith(
      displayLarge: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 38,
          color: textDarkColor,
          letterSpacing: -0.3,
        ),
      ),
      displayMedium: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 28,
          color: textDarkColor,
          letterSpacing: -0.3,
        ),
      ),
      displaySmall: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 25,
          color: textDarkColor,
          letterSpacing: -0.3,
        ),
      ),
      headlineMedium: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: textDarkColor,
          letterSpacing: -0.3,
        ),
      ),
      headlineSmall: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: textDarkColor,
          letterSpacing: -0.3,
        ),
      ),
      titleLarge: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: textDarkColor,
          letterSpacing: -0.3,
        ),
      ),
      titleMedium: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: textDarkColor,
          letterSpacing: -0.3,
        ),
      ),
      titleSmall: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: textMediumColor,
          letterSpacing: -0.3,
        ),
      ),
      bodyLarge: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
          color: textDarkColor,
          letterSpacing: -0.3,
        ),
      ),
      bodyMedium: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 14,
          color: textMediumColor,
          letterSpacing: -0.3,
        ),
      ),
      bodySmall: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 12,
          color: textMediumColor,
          letterSpacing: -0.3,
        ),
      ),
      labelLarge: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Colors.white,
          letterSpacing: 0,
        ),
      ),
      labelMedium: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: textMediumColor,
          letterSpacing: -0.3,
        ),
      ),
      labelSmall: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 10,
          color: textMediumColor,
          letterSpacing: -0.3,
        ),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.rubik(
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            letterSpacing: 0,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,
        side: BorderSide(color: primaryColor.withOpacity(0.5)),
        textStyle: GoogleFonts.rubik(
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            letterSpacing: 0,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: textMediumColor,
        textStyle: GoogleFonts.rubik(
          textStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            letterSpacing: -0.3,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: textMediumColor.withOpacity(0.1)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: textMediumColor.withOpacity(0.1)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: primaryColor),
      ),
      hintStyle: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 14,
          color: textMediumColor,
          letterSpacing: -0.3,
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: surfaceColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    dividerTheme: DividerThemeData(
      color: dividerColor,
      thickness: 1,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: surfaceColor,
      selectedItemColor: primaryColor,
      unselectedItemColor: textMediumColor,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: primaryColor.withOpacity(0.1),
      disabledColor: textMediumColor.withOpacity(0.1),
      selectedColor: primaryColor,
      secondarySelectedColor: primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      labelStyle: GoogleFonts.rubik(
        textStyle: TextStyle(color: primaryColor, fontSize: 13),
      ),
      secondaryLabelStyle: GoogleFonts.rubik(
        textStyle: TextStyle(color: Colors.white, fontSize: 13),
      ),
      brightness: Brightness.light,
    ),
  );

  // Dark theme configuration 
  static final ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
      background: Color(0xFF121212),
      surface: Color(0xFF1E1E1E),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: Colors.white,
      onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: Color(0xFF121212),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white70),
      titleTextStyle: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    ),
    iconTheme: IconThemeData(color: Colors.white70),
    textTheme: GoogleFonts.rubikTextTheme().copyWith(
      displayLarge: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 38,
          color: Colors.white,
          letterSpacing: -0.3,
        ),
      ),
      displayMedium: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 28,
          color: Colors.white,
          letterSpacing: -0.3,
        ),
      ),
      displaySmall: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 25,
          color: Colors.white,
          letterSpacing: -0.3,
        ),
      ),
      headlineMedium: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: Colors.white,
          letterSpacing: -0.3,
        ),
      ),
      headlineSmall: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.white,
          letterSpacing: -0.3,
        ),
      ),
      titleLarge: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: Colors.white,
          letterSpacing: -0.3,
        ),
      ),
      titleMedium: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Colors.white,
          letterSpacing: -0.3,
        ),
      ),
      titleSmall: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Colors.white70,
          letterSpacing: -0.3,
        ),
      ),
      bodyLarge: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
          color: Colors.white,
          letterSpacing: -0.3,
        ),
      ),
      bodyMedium: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 14,
          color: Colors.white70,
          letterSpacing: -0.3,
        ),
      ),
      bodySmall: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 12,
          color: Colors.white70,
          letterSpacing: -0.3,
        ),
      ),
      labelLarge: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Colors.white,
          letterSpacing: 0,
        ),
      ),
      labelMedium: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: Colors.white70,
          letterSpacing: -0.3,
        ),
      ),
      labelSmall: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 10,
          color: Colors.white70,
          letterSpacing: -0.3,
        ),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.rubik(
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            letterSpacing: 0,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,
        side: BorderSide(color: primaryColor.withOpacity(0.5)),
        textStyle: GoogleFonts.rubik(
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            letterSpacing: 0,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white70,
        textStyle: GoogleFonts.rubik(
          textStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            letterSpacing: -0.3,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF2A2A2A),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white24),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white24),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: primaryColor),
      ),
      hintStyle: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 14,
          color: Colors.white54,
          letterSpacing: -0.3,
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: Color(0xFF2A2A2A),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.white24,
      thickness: 1,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1E1E1E),
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.white54,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: primaryColor.withOpacity(0.2),
      disabledColor: Colors.white24,
      selectedColor: primaryColor,
      secondarySelectedColor: primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      labelStyle: GoogleFonts.rubik(
        textStyle: TextStyle(color: primaryColor, fontSize: 13),
      ),
      secondaryLabelStyle: GoogleFonts.rubik(
        textStyle: TextStyle(color: Colors.white, fontSize: 13),
      ),
      brightness: Brightness.dark,
    ),
  );
}