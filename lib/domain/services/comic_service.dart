import 'package:comic_book/domain/entities/comic_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ComicService {
  final String _baseUrl = dotenv.env['BASE_URL'] ?? '';
  final String _apiKey = dotenv.env['API_KEY'] ?? '';

  Future<List<ComicModel>> fetchComics(int offset, int limit) async {
    final response = await http.get(Uri.parse(
        '${_baseUrl}issues/?api_key=$_apiKey&format=json&offset=$offset&limit=$limit&sort=store_date:desc'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final comics = (data['results'] as List)
          .map((comicJson) => ComicModel.fromJson(comicJson))
          .toList();
      return comics;
    } else {
      throw Exception('Failed to load comics');
    }
  }

  Future<ComicModel> fetchComicDetails(String id) async {
    final response = await http
        .get(Uri.parse('${_baseUrl}issue/4000-$id/?api_key=$_apiKey&format=json'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ComicModel.fromJson(data['results']);
    } else {
      throw Exception('Failed to load comic details');
    }
  }
}
