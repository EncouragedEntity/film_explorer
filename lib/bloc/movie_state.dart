import 'package:equatable/equatable.dart';

import '../models/title.dart';

class TitleState extends Equatable {
  final List<Title> titles;

  const TitleState({required this.titles});

  @override
  List<Object?> get props => [titles];
}