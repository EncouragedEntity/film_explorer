import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/title/title_bloc.dart';
import '../../bloc/title/title_event.dart';
import '../../bloc/title/title_state.dart';
import '../pages/loading_page.dart';
import 'title_card/title_card.dart';



class TitlesBlocBuilder extends StatelessWidget {
  const TitlesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TitleBloc, TitleState>(
      builder: (context, state) {
        if (state is TitleSuccessFetchDataState) {
          return CustomScrollView(
            slivers: [
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 0.65,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final title = state.titles[index];
                    return TitleCard(
                      title: title,
                      onTap: () {
                        context.read<TitleBloc>().add(ShowDetailsEvent(
                              titleId: title.id,
                              titlePageNumber: title.pageNumber,
                            ));
                      },
                    );
                  },
                  childCount: state.titles.length,
                ),
              ),
            ],
          );
        }
        if (state is TitleErrorFetchDataState) {
          return Text(state.errorMessage);
        } else {
          return const LoadingScreen();
        }
      },
    );
  }
}
