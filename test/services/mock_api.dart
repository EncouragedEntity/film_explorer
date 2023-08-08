import 'package:film_explorer/models/title.dart';
import 'package:film_explorer/services/API/api_service.dart';

class MockMovieApiService implements ApiService {
  @override
  Future<List<Title>> fetchTitles({
    int? pageNumber,
    String? sort,
    int? year,
    String? genre,
    int? startYear,
    int? endYear,
    String? titleType,
    int? limit,
    String? info,
  }) async {
    return [Title(id:'1'),Title(id:'2')];
  }

  @override
  Future<Title> fetchTitleById({
    required String id,
    String info = 'base_info',
  }) async {
    return Title(id: id, titleText: 'Mock text');
  }

  @override
  Future<Map<String, dynamic>> fetchAdditionalData(
      String id, String info) async {
    return {'Id': id, 'Info': info};
  }
}
