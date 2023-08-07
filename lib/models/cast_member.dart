import 'package:film_explorer/data/constants/links.dart';

class CastMember {
  final String id;
  final String name;
  final String? imageUrl;
  final List<String>? characterNames;

  CastMember({
    required this.id,
    required this.name,
    this.imageUrl,
    this.characterNames,
  });

  factory CastMember.fromJson(Map<String, dynamic> json) {
    final nameNode = json['name'];
    if (nameNode != null) {
      final characterNodes = json['characters'];
      final List<String> characterNames = [];

      if (characterNodes != null) {
        for (var charNode in characterNodes) {
          characterNames.add(charNode['name']);
        }
      }
      final imageNode = nameNode?['primaryImage'];
      return CastMember(
        id: nameNode['id'],
        name: nameNode['nameText']['text'],
        imageUrl: imageNode == null ? noImageLink : imageNode['url'],
        characterNames: characterNames,
      );
    }
    else
    {
      return CastMember(
        id: '',
        name: '',
        imageUrl: '',
        characterNames: [],
      );
    }
  }
}
