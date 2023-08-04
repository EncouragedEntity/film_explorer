import 'package:intl/intl.dart';

class Title {
  final String id;
  final String primaryImageId;
  final int imageWidth;
  final int imageHeight;
  final String imageUrl;
  final String imageCaption;
  final String titleType;
  final String titleText;
  final String originalTitleText;
  final int releaseYear;
  final int releaseDay;
  final int releaseMonth;
  final int releaseYearRangeEnd;

  DateTime get releaseDate => DateTime(releaseYear, releaseMonth, releaseDay);
  String get formattedReleaseDate => DateFormat.yMd().format(releaseDate);

  Title({
    required this.id,
    required this.primaryImageId,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageUrl,
    required this.imageCaption,
    required this.titleType,
    required this.titleText,
    required this.originalTitleText,
    required this.releaseYear,
    required this.releaseDay,
    required this.releaseMonth,
    required this.releaseYearRangeEnd,
  });

  factory Title.fromJson(Map<String, dynamic> json) {
    final releaseYearRange = json['releaseYear']['yearRange'];
    return Title(
      id: json['id'],
      primaryImageId: json['primaryImage']['id'],
      imageWidth: json['primaryImage']['width'],
      imageHeight: json['primaryImage']['height'],
      imageUrl: json['primaryImage']['url'],
      imageCaption: json['primaryImage']['caption']['plainText'],
      titleType: json['titleType']['text'],
      titleText: json['titleText']['text'],
      originalTitleText: json['originalTitleText']['text'],
      releaseYear: json['releaseYear']['year'],
      releaseDay: json['releaseDate']['day'],
      releaseMonth: json['releaseDate']['month'],
      releaseYearRangeEnd: releaseYearRange != null ? releaseYearRange['endYear'] : null,
    );
  }
}
