import 'package:intl/intl.dart';

class Title {
  final String id;
  final String? primaryImageURL;
  final String titleType;
  final String titleText;
  final String originalTitleText;
  final int releaseYear;
  final int? releaseDateDay;
  final int? releaseDateMonth;
  final int? releaseDateYear;

  DateTime get releaseDate {
    if(releaseDateMonth == null || releaseDateDay == null)
    {
      return DateTime(releaseYear);
    }
    return DateTime(releaseYear, releaseDateMonth!, releaseDateDay!);
  }
  String get formattedReleaseDate => DateFormat.yMd().format(releaseDate);

  Title({
    required this.id,
    required this.primaryImageURL,
    required this.titleType,
    required this.titleText,
    required this.originalTitleText,
    required this.releaseYear,
    this.releaseDateDay,
    this.releaseDateMonth,
    this.releaseDateYear,
  });

  factory Title.fromJson(Map<String, dynamic> json) {
    final results = json['results'] as Map<String, dynamic>?;

    if (results != null) {
      final primaryImage = results['primaryImage'] as Map<String, dynamic>?;

      return Title(
        id: results['id'],
        primaryImageURL: primaryImage?['url'] ?? '',
        titleType: results['titleType']['text'],
        titleText: results['titleText']['text'],
        originalTitleText: results['originalTitleText']['text'],
        releaseYear: results['releaseYear']['year'],
        releaseDateDay: results['releaseDate']?['day'],
        releaseDateMonth: results['releaseDate']?['month'],
        releaseDateYear: results['releaseDate']?['year'],
      );
    } else {
      return Title(
        id: json['_id'],
        primaryImageURL: json['primaryImage']?['url'],
        titleType: json['titleType']['text'],
        titleText: json['titleText']['text'],
        originalTitleText: json['originalTitleText']['text'],
        releaseYear: json['releaseYear']['year'],
        releaseDateDay: json['releaseDate']?['day'],
        releaseDateMonth: json['releaseDate']?['month'],
        releaseDateYear: json['releaseYear']?['year'],
      );
    }
  }
}
