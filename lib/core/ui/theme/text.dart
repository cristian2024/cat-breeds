import 'package:cat_breeds/core/ui.dart';
import 'package:flutter/material.dart' show Brightness, FontWeight, TextTheme, ThemeData;
import 'package:google_fonts/google_fonts.dart';

final _titleFont = GoogleFonts.judson();

final _textFont = GoogleFonts.roboto();

///obtains the textTheme that later will be used on the Theme
///[data] is used to build the base text styles for the theme
TextTheme getTextTheme(ThemeData data) {
  final isDark = data.brightness == Brightness.dark;
  //defining basic color for text
  final titleFont = _titleFont.copyWith(
    color: isDark ? AppColors.white : AppColors.black,
  );
  final textFont = _textFont.copyWith(
    color: isDark ? AppColors.white : AppColors.black,
  );
  return data.textTheme.copyWith(
    titleLarge: titleFont.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: textFont.copyWith(),
  );
}
