import 'package:flutter/material.dart';

class HotelTheme {
  static const String _fontName = "WorkSans";
  static const Color _primaryColor = Color(0xff7FBA67);
  static const Color _secondaryColor = Color(0xff7FBA67);
  static const Color _backgroundColor = Color(0xFFFFFFFF);
  static const Color _scaffoldBackgroundColor = Color(0xFFF6F6F6);
  static const Color _errorColor = Color(0xFFB00020);

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(fontFamily: _fontName),
      displayMedium: base.displayMedium?.copyWith(fontFamily: _fontName),
      displaySmall: base.displaySmall?.copyWith(fontFamily: _fontName),
      headlineMedium: base.headlineMedium?.copyWith(fontFamily: _fontName),
      headlineSmall: base.headlineSmall?.copyWith(fontFamily: _fontName),
      titleLarge: base.titleLarge?.copyWith(fontFamily: _fontName),
      titleMedium: base.titleMedium?.copyWith(fontFamily: _fontName),
      titleSmall: base.titleSmall?.copyWith(fontFamily: _fontName),
      bodyLarge: base.bodyLarge?.copyWith(fontFamily: _fontName),
      bodyMedium: base.bodyMedium?.copyWith(fontFamily: _fontName),
      bodySmall: base.bodySmall?.copyWith(fontFamily: _fontName),
      labelLarge: base.labelLarge?.copyWith(fontFamily: _fontName),
      labelSmall: base.labelSmall?.copyWith(fontFamily: _fontName),
    );
  }

  static ThemeData buildLightTheme() {
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: _primaryColor,
      secondary: _secondaryColor,
      error: _errorColor,
    );

    final ThemeData base = ThemeData.light();

    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: _primaryColor,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: _scaffoldBackgroundColor,
      focusColor: _backgroundColor,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      disabledColor: _errorColor,
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      appBarTheme: AppBarTheme(
        backgroundColor: _backgroundColor,
        foregroundColor: Colors.black,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontFamily: _fontName,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      useMaterial3: false, // ← يمكنك تغييره إلى true إذا أردت دعم Material 3
      platform: TargetPlatform.iOS,
    );
  }
}
