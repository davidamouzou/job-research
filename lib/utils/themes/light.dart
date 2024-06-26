import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffFFD43E),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        brightness: Brightness.light,
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)
            )
          )
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)
            )
          )
        )
      );