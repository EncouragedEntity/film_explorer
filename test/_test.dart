import 'package:flutter_test/flutter_test.dart';
import 'services/mock_api.dart';

void main() {
  late MockMovieApiService mockService;

  setUp(() {
    mockService = MockMovieApiService();
  });

  test('fetchTitles returns a list of titles', () async {
    final titles = await mockService.fetchTitles();
    expect(titles.length, 2);
    expect(titles[0].id, '1');
    expect(titles[1].id, '2');
  });

  test('fetchTitleById returns a title', () async {
    const id = '123';
    final title = await mockService.fetchTitleById(id: id);
    expect(title.id, id);
    expect(title.titleText, 'Mock text');
  });

  test('fetchAdditionalData returns a map of data', () async {
    const id = '123';
    const info = 'additional_info';
    final data = await mockService.fetchAdditionalData(id, info);
    expect(data['Id'], id);
    expect(data['Info'], info);
  });
}
