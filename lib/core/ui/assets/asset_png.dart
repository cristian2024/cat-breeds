import 'package:flutter/material.dart' show BuildContext, Image, Widget;

enum AssetPNG {
  catHead('cat_head'),
  cfaIcon('cfa'),
  vcaIcon('vca'),
  vetStreetIcon('vetstreet'),
  wikipediaIcon('wikipedia');

  const AssetPNG(this.fileName);
  final String fileName;
}

extension AssetPNGWidget on AssetPNG {
  Widget getImg(
    BuildContext context, {
    double? height,
    double? width,
  }) {
    return Image.asset(
      'assets/png/$fileName.png',
      height: height,
      width: width,
    );
  }
}
