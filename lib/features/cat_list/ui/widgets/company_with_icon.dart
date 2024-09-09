import 'package:cat_breeds/core/ui.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyWithIcon extends StatelessWidget {
  const CompanyWithIcon({super.key, 
    required this.icon,
    required this.url,
    required this.companyName,
  });
  final AssetPNG icon;
  final String companyName;
  final String url;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        try {
          final uri = Uri.parse(url);
          await launchUrl(uri);
        } catch (_) {}
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon.getImg(context, height: 24),
            const SizedBox(width: 8),
            Text(companyName),
          ],
        ),
      ),
    );
  }
}
