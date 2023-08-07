class Director {
  final String id;
  final String name;

  Director({required this.id, required this.name});

  factory Director.fromJson(Map<String, dynamic> json) {
    final name = json['name']['nameText']['text'];
    final id = json['name']['id'];
    
    return Director(id: id, name: name);
  }
}
