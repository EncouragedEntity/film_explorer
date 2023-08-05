import 'package:equatable/equatable.dart';

import '../models/title.dart';

abstract class TitleState extends Equatable
{
  const TitleState();
}

class TitleInitialState extends TitleState
{
  const TitleInitialState();

  @override
  List<Object?> get props => [];
}

class TitleLoadingState extends TitleState {
  const TitleLoadingState();

  @override
  List<Object?> get props => [];
}

class TitleErrorFetchDataState extends TitleState {
  final String errorMessage;
  const TitleErrorFetchDataState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [];
}
class TitleSuccessFetchDataState extends TitleState {
  final List<Title> titles;
  const TitleSuccessFetchDataState({
    required this.titles,
  });

  @override
  List<Object?> get props => titles;
}