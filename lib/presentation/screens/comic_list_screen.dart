import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/blocs/comic_bloc.dart';
import '../../application/blocs/comic_event.dart';
import '../../application/blocs/comic_state.dart';
import '../layout/dashboard_layout.dart';
import '../tokens/theme_spacing.dart';
import '../widgets/comic_item.dart';

class ComicListScreen extends StatefulWidget {
  const ComicListScreen({super.key});

  @override
  _ComicListScreenState createState() => _ComicListScreenState();
}

class _ComicListScreenState extends State<ComicListScreen> {
  final ScrollController _scrollController = ScrollController();
  
  @override
  void initState() {
    super.initState();
    context.read<ComicBloc>().add(FetchComics());

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        context.read<ComicBloc>().add(FetchComics(resetOffset: false));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      title: const Text('ComicBooks'),
      padding: ThemeSpacing.spaceXS,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ThemeSpacing.spaceXS),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            const Text(
              'Latest Issues',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const Divider(),
            Expanded(
              child: BlocBuilder<ComicBloc, ComicState>(
                builder: (context, state) {
                  if (state is ComicLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ComicLoaded) {
                    if (state.comics.isEmpty) {
                      return const Center(child: Text("No comics available."));
                    }
                    return ListView.separated(
                      controller: _scrollController,
                      itemCount: state.comics.length + 1,
                      itemBuilder: (context, index) {
                        if (index < state.comics.length) {
                          final comic = state.comics[index];
                          return ComicItem(comic: comic);
                        } else {
                          return const Center(child: CircularProgressIndicator());
                        }
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                    );
                  } else if (state is ComicError) {
                    return Center(child: Text('Failed to load comics: ${state.message}'));
                  } else {
                    return const Center(child: Text('No comics available.'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
