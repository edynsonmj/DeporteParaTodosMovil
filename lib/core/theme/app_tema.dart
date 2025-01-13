import 'package:flutter/material.dart';
import 'package:movil/core/theme/color_tema.dart';

class AppTheme {
  final ColorScheme _colorScheme = const ColorScheme(
      brightness: Brightness.light,
      primary: ColorTheme.primary, // Fondo principal
      onPrimary: ColorTheme.tonal, // Texto sobre fondo principal
      secondary: ColorTheme.secondary, // Fondo secundario
      onSecondary: ColorTheme.tonal, // Texto sobre fondo secundario
      error: ColorTheme.error, // Fondo para errores
      onError: ColorTheme.tonal, // Texto sobre fondo de errores
      surface: Colors.white, // Fondo de superficie
      onSurface: Colors.black); // Texto sobre superficie

  ThemeData theme() {
    return ThemeData(
      colorScheme: _colorScheme,
      elevatedButtonTheme: _elevatedButton(),
      //fontFamily: 'FiraSans',
      useMaterial3: true,
    );
  }

  ElevatedButtonThemeData _elevatedButton() {
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorTheme.primary,
            foregroundColor: Colors.white));
  }
}
