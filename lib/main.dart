import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'application/blocs/comic_bloc.dart';
import 'config/router/app_router.dart';
import 'presentation/tokens/app_theme.dart';
import 'domain/repositories/comic_repository.dart';
import 'domain/services/comic_service.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  final comicApiService = ComicService();
  final comicRepository = ComicRepository(comicApiService);

  runApp(BlocsProviders(comicRepository: comicRepository));
}

class BlocsProviders extends StatelessWidget {
  final ComicRepository comicRepository;
  const BlocsProviders({super.key, required this.comicRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ComicBloc(comicRepository: comicRepository)),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme(isDarkmode: false).getTheme(),
      title: 'ComicBooks',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
