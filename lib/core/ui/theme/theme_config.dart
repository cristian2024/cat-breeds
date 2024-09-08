// ThemeData

import 'package:cat_breeds/core/ui.dart';
import 'package:flutter/material.dart';

final _baseLightTheme = ThemeData.light();
final _baseDarkTheme = ThemeData.dark();

ThemeData getLigthTheme() {
  return _baseLightTheme.copyWith(
    textTheme: getTextTheme(
      _baseLightTheme,
    ),
    colorScheme: _baseLightTheme.colorScheme.copyWith(
      primary: AppColors.vanillaIce,
    ),
    scaffoldBackgroundColor: AppColors.white,
  );
}

ThemeData getDarkTheme() {
  return _baseDarkTheme.copyWith(
    textTheme: getTextTheme(
      _baseDarkTheme,
    ),
  );
}



