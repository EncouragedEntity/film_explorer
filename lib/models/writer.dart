class Writer {
  final String id;
  final String name;

  Writer({required this.id, required this.name});

  factory Writer.fromJson(Map<String, dynamic> json) {
    final name = json['name']['nameText']['text'];
    final id = json['name']['id'];
    
    return Writer(id: id, name: name);
  }
}
