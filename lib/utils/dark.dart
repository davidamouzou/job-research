import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffFFD43E),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)
            )
          )
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
             padding: const EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)
            )
          )
        )
      );