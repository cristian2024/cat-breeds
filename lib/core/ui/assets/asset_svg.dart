import 'package:flutter/material.dart' show BuildContext, Widget;
import 'package:flutter_svg/svg.dart';

enum AssetSVG {
  catHead('cat_head'),
  emotionless('emotionless_face'),
  brain('brain'),
  location('location'),
  apple('apple'),
  cardiology('cardiology');

  const AssetSVG(this.fileName);
  final String fileName;
}

extension AssetSVGWidget on AssetSVG {
  Widget getWidget(
    BuildContext context, {
    double? height,
    double? width,
  }) {
    return SvgPicture.asset(
      'assets/svg/$fileName.svg',
      height: height,
      width: width,
    );
  }
}
