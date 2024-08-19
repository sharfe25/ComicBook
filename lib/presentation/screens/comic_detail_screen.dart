import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/blocs/comic_bloc.dart';
import '../../application/blocs/comic_event.dart';
import '../../application/blocs/comic_state.dart';
import '../../utils/string_util.dart';
import '../layout/dashboard_layout.dart';
import '../tokens/theme_colors.dart';
import '../tokens/theme_spacing.dart';
import '../widgets/section.dart';

class ComicDetailScreen extends StatefulWidget {
  final String comicId;

  const ComicDetailScreen({super.key, required this.comicId});

  @override
  State<ComicDetailScreen> createState() => _ComicDetailScreenState();
}

class _ComicDetailScreenState extends State<ComicDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ComicBloc>().add(FetchComicDetails(id: widget.comicId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComicBloc, ComicState>(
      builder: (context, state) {
        if (state is ComicLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ComicDetailLoaded) {
          return DashboardLayout(
            goBack: true,
            appBarColor: ThemeColors.grayAppBarColor,
            title: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                  color: ThemeColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: state.comic.name,
                    style: const TextStyle(fontSize: 20)
                  ),
                  TextSpan(
                    text: ' #${state.comic.issueNumber}',
                    style: const TextStyle(color: ThemeColors.grayColor),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: ThemeColors.backgroundHeaderColor,
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: ThemeColors.backgroundGrayColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5))),
                      margin: const EdgeInsets.only(top: ThemeSpacing.spaceXS),
                      padding: const EdgeInsets.all(ThemeSpacing.spaceXS),
                      child: Image.network(
                          width: 100, state.comic.image!.mediumUrl),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(ThemeSpacing.spaceXS),
                    child: Text(
                        StringUtil.formatHtml(state.comic.description ?? '')),
                  ),
                  Section(title: 'Creators', detail: state.comic.persons),
                  Section(title: 'Characters', detail: state.comic.characters),
                  Section(title: 'Teams', detail: state.comic.teams),
                  Section(title: 'Locations', detail: state.comic.locations),
                  Section(title: 'Concepts', detail: state.comic.concepts)
                ],
              ),
            ),
          );
        } else {
          return const Text("No comic available.");
        }
      },
    );
  }
}
