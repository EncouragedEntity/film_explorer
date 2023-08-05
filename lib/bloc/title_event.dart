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
  });
  final int? pageNumber;
  final String? sort;
  final int? year;
  final String? genre;
  final int? startYear;
  final int? endYear;
  final String? titleType;
  final int? limit;

  @override
  List<Object?> get props => [];
}

class NextPageEvent extends TitleEvent
{
  NextPageEvent(this.pageNum);

  final int pageNum;
  @override
  List<Object?> get props => [];
}

class PreviousPageEvent extends TitleEvent
{
  PreviousPageEvent(this.pageNum);

  final int pageNum;
  @override
  List<Object?> get props => [];
}

class GotoPageEvent extends TitleEvent
{
  final int pageNumber;

  GotoPageEvent(this.pageNumber);
  @override
  List<Object?> get props => [];
}