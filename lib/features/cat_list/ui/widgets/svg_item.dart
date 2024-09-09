import 'package:cat_breeds/core/ui.dart';
import 'package:flutter/material.dart';

class SvgItem extends StatelessWidget {
  const SvgItem({
    super.key,
    required this.text,
    this.suffixText,
    required this.icon,
    required this.title,
  });

  final String title;
  final String text;
  final String? suffixText;
  final AssetSVG icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Center(
            child: icon.getWidget(
              context,
              height: 18,
            ),
          ),
        ),
        const SizedBox(width: 4),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$title: ',
              style: context.getBodyLarge().copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              text,
              style: context.getBodyMedium(),
            ),
            if (suffixText != null)
              Text(
                ' $suffixText',
                style: context.getBodyMedium(),
              ),
          ],
        ),
      ],
    );
  }
}
