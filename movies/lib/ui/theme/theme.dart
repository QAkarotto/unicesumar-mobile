import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme createTextTheme(Color color) {
  final roboto = GoogleFonts.roboto();
  return Typography.material2021().englishLike.copyWith(
        headlineLarge: roboto.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: color,
        ),
        headlineMedium: roboto.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: color,
        ),
        headlineSmall: roboto.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: color,
        ),
        titleLarge: roboto.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: color,
        ),
        titleMedium: roboto.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: color,
        ),
        titleSmall: roboto.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: color,
        ),
        bodyLarge: roboto.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: color,
        ),
        bodyMedium: roboto.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: color,
        ),
        bodySmall: roboto.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: color,
        ),
        labelLarge: roboto.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: color,
        ),
        labelMedium: roboto.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: color,
        ),
        labelSmall: roboto.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: color,
        ),
      );
}

ThemeData createTheme(ThemeMode themeMode) {
  final isDark = themeMode == ThemeMode.dark;
  final backgroundColor = isDark ? const Color(0xFF111111) : Colors.white;
  final surfaceColor =
      isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF2F2F2);
  final posterBorderColor =
      isDark ? const Color(0xFFB5A9A9) : const Color(0xFF7A7A7A);
  final buttonGreyColor =
      isDark ? const Color(0xFF504F4F) : const Color(0xFFE0E0E0);
  final onSurfaceColor = isDark ? Colors.white : Colors.black;

  return ThemeData(
    brightness: isDark ? Brightness.dark : Brightness.light,
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: isDark ? Brightness.dark : Brightness.light,
      background: backgroundColor,
      surface: surfaceColor,
      onSurface: onSurfaceColor,
      onBackground: onSurfaceColor,
      primary: Colors.blue,
      onPrimary: Colors.white,
      surfaceVariant: buttonGreyColor,
      onSurfaceVariant: posterBorderColor,
    ),
    textTheme: createTextTheme(onSurfaceColor),
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundColor,
      foregroundColor: onSurfaceColor,
      iconTheme: IconThemeData(color: onSurfaceColor),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: surfaceColor,
      labelTextStyle: WidgetStateTextStyle.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(color: onSurfaceColor);
          }
          return TextStyle(color: posterBorderColor);
        },
      ),
      iconTheme: WidgetStateProperty.all<IconThemeData>(
        IconThemeData(color: onSurfaceColor),
      ),
      indicatorColor: posterBorderColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: surfaceColor,
      selectedItemColor: onSurfaceColor,
      unselectedItemColor: posterBorderColor,
      unselectedLabelStyle: TextStyle(color: posterBorderColor),
      showUnselectedLabels: true,
    ),
  );
}
