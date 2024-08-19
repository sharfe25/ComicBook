import 'package:comic_book/domain/entities/comic_model.dart';
import 'package:comic_book/presentation/tokens/theme_colors.dart';
import 'package:comic_book/presentation/tokens/theme_spacing.dart';
import 'package:comic_book/utils/date_util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ComicItem extends StatelessWidget {
  const ComicItem({super.key, required this.comic});
  final ComicModel comic;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/comic/${comic.id.toString()}'),
      child: Column(
        children: [
          Image.network(comic.image!.mediumUrl),
          const SizedBox(
            height: ThemeSpacing.spaceXS,
          ),
          Text(
            '${comic.name} #${comic.issueNumber}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(DateUtil.formatDate(comic.storeDate.toString()),
              style: const TextStyle(
                color: ThemeColors.grayColor,
              )),
        ],
      ),
    );
  }
}
