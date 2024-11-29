import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lyriscope/Core/Utils/Size_Utils.dart';
import 'package:lyriscope/Core/Utils/pref_utils.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  static final ThemeHelper _instance = ThemeHelper._internal();

  factory ThemeHelper() {
    return _instance;
  }

  ThemeHelper._internal();

  // The current app theme
  final _appTheme = PrefUtils().getThemeData();

  // A map of custom color themes supported by the app
  final Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

  // A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    // Throw exception if the theme is not found
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found. Make sure you have added this theme class in JSON. Try running flutter pub run build_runner");
    }

    // Return theme from map
    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    // Throw exception if the theme is not found
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found. Make sure you have added this theme class in JSON. Try running flutter pub run build_runner");
    }

    // Return theme from map
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFFDFAFA),
      ),
      snackBarTheme: const SnackBarThemeData(actionTextColor: Colors.white),
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onPrimaryContainer,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return appTheme.pinkBackground;
          }
          return appTheme.pinkBackground;
        }),
        side: const BorderSide(
          color: Color(0XFFFF9C9C),
          width: 0,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 2,
        space: 2,
        color: _getThemeColors().gray100,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();

  static ThemeData getThemeData(String themeType) =>
      ThemeHelper()._getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
      bodySmall: GoogleFonts.brawler(
          textStyle:
              TextStyle(color: appTheme.pinkBackground, fontSize: 16.fSize)),
      bodyLarge: TextStyle(
        color: appTheme.black900,
        fontSize: 32.fSize,
        fontFamily: 'BreeSerif',
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        color: appTheme.black900,
        fontSize: 12,
      ),
      headlineLarge: TextStyle(
        color: appTheme.pinkishWhite,
        fontSize: 45.fSize,
        fontFamily: 'BreeSerif',
        fontWeight: FontWeight.w100,
      ),
      headlineMedium: TextStyle(
        color: appTheme.black900,
        fontSize: 28.fSize,
        fontFamily: 'BreeSerif',
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: TextStyle(
        color: appTheme.black900,
        fontSize: 24.fSize,
        fontFamily: 'BreeSerif',
        fontWeight: FontWeight.w300,
      ),
      titleLarge: TextStyle(
        color: appTheme.black900,
        fontSize: 20.fSize,
        fontFamily: 'BreeSerif',
        fontWeight: FontWeight.w500,
      ),
      displaySmall: GoogleFonts.brawler(
          textStyle: TextStyle(
              color: appTheme.black900,
              fontSize: 20.fSize,
              fontWeight: FontWeight.normal)),
      labelSmall: GoogleFonts.breeSerif(
          textStyle: TextStyle(
              fontSize: 16.fSize,
              color: appTheme.black900,
              fontWeight: FontWeight.normal)),
      titleSmall: GoogleFonts.breeSerif(
          textStyle: TextStyle(
              fontSize: 16.fSize,
              color: appTheme.black900,
              fontWeight: FontWeight.bold)),
      titleMedium: GoogleFonts.breeSerif(
        textStyle: TextStyle(
            fontSize: 18.fSize,
            color: Colors.black,
            fontWeight: FontWeight.normal),
      ),
      displayLarge: GoogleFonts.breeSerif(
          textStyle: TextStyle(
              fontSize: 28.adaptSize,
              color: appTheme.black900,
              fontWeight: FontWeight.normal)),
      displayMedium: TextStyle(
        color: appTheme.black900,
        fontSize: 16.fSize,
        fontFamily: 'BreeSerif',
        fontWeight: FontWeight.w300,
      ),
      labelMedium: GoogleFonts.breeSerif(
          textStyle: TextStyle(
              fontSize: 18.fSize,
              color: appTheme.pinkBackground,
              fontWeight: FontWeight.normal)));
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFFFF9C9C),

    // On colors(text colors)
    onPrimary: Color(0XFFF5F5F5),
    onPrimaryContainer: Color(0XFFF5F5F5),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => const Color(0XFF000000);

  // Gray
  Color get gray100 => const Color(0XFFF5F5F5);

  Color get pinkBackground => const Color(0XFFFF9C9C);

  Color get pinkishWhite => const Color(0XFFFFFFFF);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
