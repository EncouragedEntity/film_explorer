import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_explorer/bloc/title_bloc.dart';
import 'package:film_explorer/bloc/title_event.dart';
import 'package:flutter/material.dart';
import 'package:film_explorer/models/title.dart' as title_model;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'rating_display.dart';

class TitleDetailsScreen extends StatefulWidget {
  const TitleDetailsScreen({required this.title, super.key});
  final title_model.Title title;

  @override
  State<TitleDetailsScreen> createState() => _TitleDetailsScreenState();
}

class _TitleDetailsScreenState extends State<TitleDetailsScreen> {
  late final ScrollController _scrollController;
  double _appBarOpacity = 1.0;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    setState(() {
      _appBarOpacity = _calculateAppBarOpacity();
    });
  }

  double _calculateAppBarOpacity() {
    double offset = _scrollController.offset;
    double maxOffset = 100.0;
    return 1.0 - (offset / maxOffset);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.title;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(_appBarOpacity),
        title: Text(title.titleText),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<TitleBloc>().add(FetchTitlesEvent(pageNumber: widget.title.pageNumber));
          },
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CachedNetworkImage(
                    imageUrl: title.primaryImageURL!,
                    fit: BoxFit.contain,
                  ),
                ),
                RatingDisplay(
                    rating: (title.ratingsSummary['aggregateRating'] ?? 0)
                        .toDouble()),
                Text('Votes: ${title.ratingsSummary['voteCount']}'),
              ],
            ),
          ),
          // Add other slivers for content here
        ],
      ),
    );
  }
}
