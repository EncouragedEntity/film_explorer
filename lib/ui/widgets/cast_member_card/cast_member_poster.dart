import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CastMemberPoster extends StatelessWidget {
  const CastMemberPoster({required this.imageUrl, super.key});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: SizedBox(
        width: 100,
        height: 130,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
