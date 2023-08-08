import 'package:film_explorer/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:film_explorer/models/title.dart' as film_model;
import 'card_poster_image.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({required this.title, required this.onTap, super.key});

  final film_model.Title title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: secondaryColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardPoster(
                imageUrl: title.primaryImageURL,
              ),
            ),
            Text(
              title.titleText,
              textAlign: TextAlign.center,
            ),
            Text('${title.releaseYear}'),
          ],
        ),
      ),
    );
  }
}
