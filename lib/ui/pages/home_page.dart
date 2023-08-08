import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/title/title_bloc.dart';
import '../../bloc/title/title_event.dart';
import '../../bloc/title/title_state.dart';
import 'loading_page.dart';
import 'title_details_page.dart';
import 'titles_page.dart';

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
        if (state is TitleDetailsSuccessFetchState) {
          return TitleDetailsScreen(
            title: state.title,
          );
        }
        if (state is TitleErrorFetchDataState) {
          showDialog(
            context: context,
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                title: const Text('Error'),
                content: Text(state.errorMessage),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      exit(0);
                    },
                  ),
                ],
              );
            },
          );
        }
        return const LoadingScreen();
      },
    );
  }
}
