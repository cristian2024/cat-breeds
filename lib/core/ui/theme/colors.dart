import 'package:flutter/material.dart'
    show BuildContext, Color, Theme, ThemeData;

abstract class AppColors {
  static const Color white = Color(0xFFF5F5F5);
  static const Color shipGray = Color(0xff49454F);
  static const Color black = Color(0xff0E0E0E);

  static const Color vanillaIce = Color(0xffF1DBDD);
  static const Color carouselPink = Color(0xffFEFAFB);
}

extension ThemeColors on BuildContext {
  ThemeData _getTheme() {
    return Theme.of(this);
  }

  Color getPrimarColor() {
    return _getTheme().colorScheme.primary;
  }
}
