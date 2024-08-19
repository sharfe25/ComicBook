import 'package:comic_book/domain/entities/comic_model.dart';

import '../services/comic_service.dart';


class ComicRepository {
  final ComicService _comicApiService;

  ComicRepository(this._comicApiService);

  Future<List<ComicModel>> getComics(int offset, int limit) {
    return _comicApiService.fetchComics(offset, limit);
  }

  Future<ComicModel> getComicDetails(String id) {
    return _comicApiService.fetchComicDetails(id);
  }
}
