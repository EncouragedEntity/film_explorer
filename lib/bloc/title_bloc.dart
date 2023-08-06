import 'package:bloc/bloc.dart';
import 'package:film_explorer/data/API/api.dart';
import 'title_event.dart';
import 'title_state.dart';

class TitleBloc extends Bloc<TitleEvent, TitleState> {
  final MovieAPI movieAPI = MovieAPI();

  TitleBloc() : super(const TitleLoadingState()) {
    on<FetchTitlesEvent>(_onFetchDataEvent);
    on<GotoPageEvent>(_onGotoPageEvent);
    on<ShowDetailsEvent>(_onShowDetailsEvent);
  }

  Future<void> _onShowDetailsEvent(
    ShowDetailsEvent event,
    Emitter<TitleState> emitter,
  ) async {
    emitter(const TitleLoadingState());
    try {
      final title = await movieAPI.fetchTitleById(id: event.titleId);
      title.pageNumber = event.titlePageNumber;
      emitter(TitleDetailsSuccessFetchState(title: title));
    } on Exception catch (error) {
       emitter(TitleErrorFetchDataState(errorMessage: error.toString()));
    }
  }

  Future<void> _onGotoPageEvent(
    GotoPageEvent event,
    Emitter<TitleState> emitter,
  ) async {
    emitter(const TitleLoadingState());
    await _onFetchDataEvent(
        FetchTitlesEvent(pageNumber: event.pageNumber), emitter);
  }

  Future<void> _onFetchDataEvent(
    FetchTitlesEvent event,
    Emitter<TitleState> emitter,
  ) async {
    emitter(const TitleLoadingState());
    try {
      final titles = await movieAPI.fetchTitles(
        pageNumber: event.pageNumber,
        year: event.year,
        startYear: event.startYear,
        endYear: event.endYear,
        sort: event.sort,
        genre: event.genre,
        titleType: event.titleType,
        limit: event.limit,
        info: event.info,
      );
      emitter(TitleSuccessFetchDataState(titles: titles));
    } on Exception catch (error) {
      emitter(TitleErrorFetchDataState(errorMessage: error.toString()));
    }
  }
}
