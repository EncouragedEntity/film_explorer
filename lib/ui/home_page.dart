import 'package:film_explorer/ui/titles_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/title_bloc.dart';
import '../bloc/title_event.dart';
import '../bloc/title_state.dart';
import 'loading_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    context.read<TitleBloc>().add(FetchTitlesEvent());
    return BlocBuilder<TitleBloc, TitleState>(
      builder: (context, state) {
        if (state is TitleLoadingState) {
          return const LoadingScreen();
        }
        if (state is TitleSuccessFetchDataState) {
          return const TitlesScreen();
        }
        if (state is TitleErrorFetchDataState) {
          return Text(state.errorMessage);
        }
        return const LoadingScreen();
      },
    );
  }
}
