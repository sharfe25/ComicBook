import 'package:comic_book/presentation/tokens/theme_spacing.dart';
import 'package:comic_book/presentation/widgets/section_item.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/basic_details_model.dart';

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.title,
    required this.detail,
  });
  final String title;
  final List<BasicDetailsModel>? detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ThemeSpacing.spaceXS),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Divider(),
          const SizedBox(
            height: ThemeSpacing.spaceXXS,
          ),
          detail != null
              ? GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 2,
                  ),
                  itemCount: detail!.length,
                  itemBuilder: (context, index) {
                    final BasicDetailsModel item = detail![index];
                    return SectionItem(
                        title: item.name,
                        subtitle: item.role,
                        imageUrl:
                            'https://comicvine.gamespot.com/a/uploads/square_avatar/0/5344/1186336-elizabeth_howlett_02.jpg');
                  },
                )
              : const SizedBox(
                  height: ThemeSpacing.spaceL,
                ),
        ],
      ),
    );
  }
}
