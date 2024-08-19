import 'package:comic_book/presentation/screens/comic_detail_screen.dart';
import 'package:comic_book/presentation/screens/comic_list_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const ComicListScreen(),
    ),

    GoRoute(
      path: '/comic/:id',
      builder: (context, state) {
        final comicId = state.pathParameters['id']!;
        return ComicDetailScreen(comicId: comicId);
      },
    ),

  ]);