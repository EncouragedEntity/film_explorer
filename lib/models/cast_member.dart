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
    final characterNodes = json['characters'];

    final List<String> characterNames = [];

    for (var charNode in characterNodes) {
      characterNames.add(charNode['name']);
    }

    return CastMember(
      id: nameNode['id'],
      name: nameNode['nameText']['text'],
      imageUrl: nameNode['primaryImage']['url'],
      characterNames: characterNames,
    );
  }
}
