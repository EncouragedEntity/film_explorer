import 'package:equatable/equatable.dart';

abstract class TitleEvent extends Equatable {}

class FetchTitlesEvent extends TitleEvent {
  FetchTitlesEvent({
    this.pageNumber,
    this.sort,
    this.year,
    this.genre,
    this.startYear,
    this.endYear,
    this.titleType,
    this.limit,
    this.info,
  });
  final int? pageNumber;
  final String? sort;
  final int? year;
  final String? genre;
  final int? startYear;
  final int? endYear;
  final String? titleType;
  final int? limit;
  final String? info;

  @override
  List<Object?> get props => [
        pageNumber,
        sort,
        year,
        genre,
        startYear,
        endYear,
        titleType,
        limit,
        info,
      ];
}

class GotoPageEvent extends TitleEvent {
  final int pageNumber;

  GotoPageEvent(this.pageNumber);
  @override
  List<Object?> get props => [pageNumber];
}

class ShowDetailsEvent extends TitleEvent {
  final String titleId;
  final String? info;
  final int titlePageNumber;

  ShowDetailsEvent({required this.titleId, required this.titlePageNumber, this.info});
  @override
  List<Object?> get props => [titleId, info, titlePageNumber];
}
