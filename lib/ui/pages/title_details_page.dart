import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_explorer/constants/colors.dart';
import 'package:film_explorer/ui/widgets/cast_member_card/cast_member_card.dart';
import 'package:flutter/material.dart';
import 'package:film_explorer/models/title.dart' as title_model;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';

import '../../bloc/title/title_bloc.dart';
import '../../bloc/title/title_event.dart';
import '../../constants/links.dart';
import '../widgets/divided_tab.dart';
import '../widgets/rating_display.dart';

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
                    title.openInBrowser();
                  },
                  icon: const Icon(Icons.public),
                ),
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
                titlePadding: const EdgeInsets.only(
                  left: 10,
                  bottom: 10,
                  right: 65,
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.titleText,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      '(${title.releaseYear})',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
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
                    if (title.runtime != null)
                      Text(
                        title.runtime['displayableProperty']['value']
                            ['plainText'],
                        style: const TextStyle(
                          color: textColor,
                          fontSize: 16,
                        ),
                      ),
                    Center(
                      child: Wrap(
                        spacing: 8.0,
                        children: (title.genres['genres'] as List<dynamic>)
                            .map(
                              (genre) => Chip(
                                label: Text(
                                  genre['text'],
                                  style: const TextStyle(color: textColor),
                                ),
                                backgroundColor: secondaryColor,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    if (title.ratingsSummary['aggregateRating'] != null)
                      Row(
                        children: [
                          RatingDisplay(
                              rating:
                                  (title.ratingsSummary['aggregateRating'] ?? 0)
                                      .toDouble()),
                          Text(title.ratingsSummary['aggregateRating']
                              .toString()),
                        ],
                      )
                    else
                      RatingDisplay(
                          rating: (title.ratingsSummary['aggregateRating'] ?? 0)
                              .toDouble()),
                    Text('Votes: ${title.ratingsSummary['voteCount']}'),
                    const SizedBox(
                      height: 12,
                    ),
                    if (title.plot != null)
                      Text(title.plot['plotText']['plainText']),
                    if (title.directors.isNotEmpty)
                      DividedTab(
                        alignment: Alignment.centerLeft,
                        divider: const Divider(color: textColor),
                        child: Text(
                          'Directors: ${title.directors.map((item) => item.name).join(', ')}',
                        ),
                      ),
                    if (title.writers.isNotEmpty)
                      DividedTab(
                        alignment: Alignment.centerLeft,
                        divider: const Divider(color: textColor),
                        child: Text(
                            'Writers: ${title.writers.map((item) => item.name).join(', ')}'),
                      ),
                    if (title.cast.isNotEmpty)
                      DividedTab(
                        divider: const Divider(
                          color: textColor,
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
                                return CastMemberCard(
                                  castMember: castMember,
                                );
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
