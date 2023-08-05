import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:film_explorer/models/title.dart';

class MovieAPI {
  final String baseUrl = 'https://moviesdatabase.p.rapidapi.com';
  final headers = {
    'X-RapidAPI-Key': 'cac8324384msh88ed298ffb4a3ffp1595eajsnc31cb8093fe7',
    'X-RapidAPI-Host': 'moviesdatabase.p.rapidapi.com',
  };

  String _addArgumentToUrl(String url, String arg, dynamic value) {
    if (value != null) {
      final separator = url.contains('?') ? '&' : '?';
      return '$url$separator$arg=$value';
    }
    return url;
  }

  Future<List<Title>> fetchTitles({
    int? pageNumber,
    String? sort,
    int? year,
    String? genre,
    int? startYear,
    int? endYear,
    String? titleType,
    int? limit,
  }) async {
    String url = '$baseUrl/titles';

    url = _addArgumentToUrl(url, 'page', pageNumber);
    url = _addArgumentToUrl(url, 'sort', sort);
    url = _addArgumentToUrl(url, 'year', year);
    url = _addArgumentToUrl(url, 'genre', genre);
    url = _addArgumentToUrl(url, 'startYear', startYear);
    url = _addArgumentToUrl(url, 'endYear', endYear);
    url = _addArgumentToUrl(url, 'titleType', titleType);
    url = _addArgumentToUrl(url, 'limit', limit);

    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      final titlesList = data['results'] as List<dynamic>;

      final List<Title> titles =
          titlesList.map((item) => Title.fromJson(item)).toList();

      return titles;
    } else {
      throw Exception('Failed to fetch titles');
    }
  }
}
