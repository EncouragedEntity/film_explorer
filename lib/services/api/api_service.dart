import '../../models/title.dart';

abstract class ApiService {
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
  });

  Future<Title> fetchTitleById({
    required String id,
    String info,
  });

  Future<Map<String, dynamic>> fetchAdditionalData(String id, String info);
}
