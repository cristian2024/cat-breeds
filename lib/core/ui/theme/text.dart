import 'package:cat_breeds/core/ui.dart';
import 'package:flutter/material.dart'
    show
        Brightness,
        BuildContext,
        FontWeight,
        TextDecoration,
        TextStyle,
        TextTheme,
        Theme,
        ThemeData;
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
    titleMedium: titleFont.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: titleFont.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    displayLarge: titleFont.copyWith(
      fontSize: 64,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: textFont.copyWith(
      fontSize: 14,
    ),
    bodyLarge: textFont.copyWith(
      fontSize: 16,
    ),
    labelLarge: textFont.copyWith(
      fontSize: 15,
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.bold,
    ),
  );
}

extension TextThemeContext on BuildContext {
  TextTheme _getTextTheme() {
    return Theme.of(this).textTheme;
  }

  TextStyle getDisplayLarge() {
    return _getTextTheme().displayLarge ?? _titleFont;
  }

  TextStyle getTitleLarge() {
    return _getTextTheme().titleLarge ?? _titleFont;
  }
  TextStyle getTitleMedium() {
    return _getTextTheme().titleMedium ?? _titleFont;
  }

  TextStyle getTitleSmall() {
    return _getTextTheme().titleSmall ?? _titleFont;
  }

  TextStyle getBodyLarge() {
    return _getTextTheme().bodyLarge ?? _textFont;
  }
  TextStyle getLabelLarge() {
    return _getTextTheme().labelLarge ?? _textFont;
  }

  TextStyle getBodyMedium() {
    return _getTextTheme().bodyMedium ?? _textFont;
  }
}
