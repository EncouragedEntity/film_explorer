import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingDisplay extends StatelessWidget {
  final double rating;

  const RatingDisplay({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      itemSize: 25.0,
      initialRating: rating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      minRating: 0,
      maxRating: 10,
      itemCount: 10,
      ignoreGestures: true,
      ratingWidget: RatingWidget(
        full: const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        half: const Icon(
          Icons.star_half,
          color: Colors.amber,
        ),
        empty: const Icon(
          Icons.star_outline,
          color: Colors.amber,
        ),
      ),
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      onRatingUpdate: (rating) {},
    );
  }
}
