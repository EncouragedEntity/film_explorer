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
    if (arg == 'year' && value == null) {
      value = DateTime.now().year;
    }

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
    String? info = 'base_info',
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
    url = _addArgumentToUrl(url, 'info', info);

    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      final int pageNumber = int.parse(data['page'].toString());
      final titlesList = data['results'] as List<dynamic>;

      final List<Title> titles = titlesList.map((item) {
        final itemPageNumber = pageNumber;
        return Title.fromJson(item, pageNumber: itemPageNumber);
      }).toList();

      return titles;
    } else {
      throw Exception('Failed to fetch titles');
    }
  }

  Future<Title> fetchTitleById({
    required String id,
    String info = 'base_info',
  }) async {
    String url = '$baseUrl/titles/$id';

    url = _addArgumentToUrl(url, 'info', info);

    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      return Title.fromJson(data);
    } else {
      throw Exception('Failed to fetch title by ID');
    }
  }
}
