import 'package:comic_book/presentation/tokens/theme_colors.dart';
import 'package:flutter/material.dart';

import '../tokens/theme_spacing.dart';

class SectionItem extends StatelessWidget {
  const SectionItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.imageUrl});
  final String title;
  final String? subtitle;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Image.network(
              imageUrl,
            )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: ThemeSpacing.spaceXS),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                      color: ThemeColors.greenColor,
                    )),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: const TextStyle(color: ThemeColors.grayAppBarColor),
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}
