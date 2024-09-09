// ThemeData

import 'package:cat_breeds/core/ui.dart';
import 'package:flutter/material.dart';

final _baseLightTheme = ThemeData.light();
final _baseDarkTheme = ThemeData.dark();

ThemeData getLigthTheme() {
  final textTheme = getTextTheme(
    _baseLightTheme,
  );
  return _baseLightTheme.copyWith(
    textTheme: textTheme,
    colorScheme: _baseLightTheme.colorScheme.copyWith(
      primary: AppColors.vanillaIce,
    ),
    textSelectionTheme: _baseLightTheme.textSelectionTheme.copyWith(
      cursorColor: AppColors.black, // Color del cursor (palito que parpadea)
    ),
    scaffoldBackgroundColor: AppColors.lavenderblush,
    inputDecorationTheme: _baseLightTheme.inputDecorationTheme.copyWith(
      hintStyle: textTheme.bodyMedium!.copyWith(
        color: AppColors.saltBox,
      ),
      labelStyle: textTheme.bodySmall!.copyWith(color: AppColors.shipGray),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade700,
        ),
      ),
    ),
  );
}

ThemeData getDarkTheme() {
  return _baseDarkTheme.copyWith(
    textTheme: getTextTheme(
      _baseDarkTheme,
    ),
  );
}
