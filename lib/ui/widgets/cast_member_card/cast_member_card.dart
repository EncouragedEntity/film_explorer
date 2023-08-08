import 'package:film_explorer/constants/colors.dart';
import 'package:film_explorer/models/cast_member.dart';
import 'package:flutter/material.dart';

import 'cast_member_poster.dart';

class CastMemberCard extends StatelessWidget {
  const CastMemberCard({required this.castMember, super.key});

  final CastMember castMember;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: secondaryColor,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CastMemberPoster(
              imageUrl: castMember.imageUrl,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      castMember.name,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  if (castMember.characterNames != null &&
                      castMember.characterNames!.isNotEmpty)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Also known as: ${castMember.characterNames!.join(', ')}',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  castMember.openInBrowser();
                },
                icon: const Icon(Icons.more_vert, color: textColor)),
          ],
        ),
      ),
    );
  }
}
