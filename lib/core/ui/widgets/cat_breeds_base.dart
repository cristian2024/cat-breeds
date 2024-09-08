import 'package:flutter/material.dart';

import 'package:cat_breeds/core/ui.dart';

class CatBreedsBase extends StatelessWidget {
  const CatBreedsBase({
    super.key,
    required this.child,
    this.controller,
    this.onSearch,
    this.titleExtra,
  });

  final Widget child;

  final String? titleExtra;
  final TextEditingController? controller;
  final void Function(String word)? onSearch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cat breeds${titleExtra != null ? ' - $titleExtra' : ''}",
          style: context.getTitleLarge(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              maxLength: 22,
              decoration: InputDecoration(
                hintText: 'Search breed',
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                suffix: InkWell(
                  onTap: () {
                    onSearch?.call(controller?.text ?? '');
                  },
                  child: const Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
