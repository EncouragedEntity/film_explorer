import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardPoster extends StatelessWidget {
  const CardPoster({required this.imageUrl, super.key});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: imageUrl ?? 'https://placehold.co/200.png?text=No+image+provided',
          fit: imageUrl != null ? BoxFit.contain : BoxFit.fitHeight,
          placeholder: (context, url) => const SizedBox(
            width: 40,  
            height: 40, 
            child: Center(
              child: SizedBox(
                width: 20, 
                height: 20, 
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error), 
        ),
      ),
    );
  }
}
