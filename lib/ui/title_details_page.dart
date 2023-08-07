import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_explorer/bloc/title_event.dart';
import 'package:film_explorer/data/constants/links.dart';
import 'package:film_explorer/ui/divided_tab.dart';
import 'package:flutter/material.dart';
import 'package:film_explorer/models/title.dart' as title_model;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';

import '../bloc/title_bloc.dart';
import 'rating_display.dart';

class TitleDetailsScreen extends StatefulWidget {
  const TitleDetailsScreen({required this.title, super.key});
  final title_model.Title title;

  @override
  State<TitleDetailsScreen> createState() => _TitleDetailsScreenState();
}

class _TitleDetailsScreenState extends State<TitleDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final title = widget.title;

    return WillPopScope(
      onWillPop: () async {
        context.read<TitleBloc>().add(FetchTitlesEvent(
              pageNumber: title.pageNumber,
            ));
        return false;
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    FlutterShare.share(
                      title: title.titleText,
                      linkUrl: '$imdbTitle/${title.id}',
                    );
                  },
                  icon: const Icon(Icons.share),
                ),
              ],
              expandedHeight: 500,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('${title.titleText} (${title.releaseYear})'),
                background: CachedNetworkImage(
                  imageUrl: title.primaryImageURL!.isNotEmpty
                      ? title.primaryImageURL!
                      : noImageLink,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Center(
                      child: Wrap(
                        spacing: 8.0,
                        children: (title.genres['genres'] as List<dynamic>)
                            .map((genre) => Chip(label: Text(genre['text'])))
                            .toList(),
                      ),
                    ),
                    RatingDisplay(
                        rating: (title.ratingsSummary['aggregateRating'] ?? 0)
                            .toDouble()),
                    if (title.ratingsSummary['aggregateRating'] != null)
                      Text(title.ratingsSummary['aggregateRating'].toString()),
                    Text('Votes: ${title.ratingsSummary['voteCount']}'),
                    if (title.runtime != null)
                      Text(title.runtime['displayableProperty']['value']
                          ['plainText']),
                    if (title.plot != null)
                      Text(title.plot['plotText']['plainText']),
                    if (title.directors.isNotEmpty)
                      DividedTab(
                        alignment: Alignment.centerLeft,
                        divider: const Divider(color: Colors.black),
                        child: Text(
                          'Directors: ${title.directors.map((item) => item.name).join(', ')}',
                        ),
                      ),
                    if (title.writers.isNotEmpty)
                      DividedTab(
                        alignment: Alignment.centerLeft,
                        divider: const Divider(color: Colors.black),
                        child: Text(
                            'Writers: ${title.writers.map((item) => item.name).join(', ')}'),
                      ),
                    if (title.cast.isNotEmpty)
                      DividedTab(
                        divider: const Divider(
                          color: Colors.black,
                        ),
                        isLastTab: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Cast:',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: title.cast.length,
                              itemBuilder: (context, index) {
                                final castMember = title.cast[index];
                                return Text(castMember.name);
                              },
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
