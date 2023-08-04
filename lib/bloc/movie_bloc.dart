import 'package:bloc/bloc.dart';
import 'package:film_explorer/data/API/api.dart';

import 'movie_event.dart';
import 'movie_state.dart';

class TitleBloc extends Bloc<TitleEvent, TitleState> {
  final MovieAPI movieApi; 

  TitleBloc({required this.movieApi}) : super(const TitleState(titles: []));

  Stream<TitleState> mapEventToState(TitleEvent event) async* {
    if (event is FetchTitlesEvent) {
      try {
        final movies = await movieApi.fetchTitles(); 
        yield TitleState(titles: movies);
      } catch (error) {
        print('error');
      }
    }
  }
}