import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../constants/links.dart';


class CardPoster extends StatelessWidget {
  const CardPoster({required this.imageUrl, super.key});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: ClipRRect(
        child: CachedNetworkImage(
          imageUrl: imageUrl ?? noImageLink,
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
