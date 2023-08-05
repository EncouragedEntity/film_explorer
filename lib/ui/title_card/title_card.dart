import 'package:flutter/material.dart';

import '../../models/title.dart' as film_model;
import 'card_poster_image.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({required this.title, super.key});

  final film_model.Title title;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      child: Column(
        children: [
          CardPoster(
            imageUrl: title.primaryImageURL,
          ),
          Text(
            title.titleText,
            textAlign: TextAlign.center,
          ),
          Text('${title.releaseYear}'),
        ],
      ),
    );
  }
}
