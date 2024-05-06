class Genres {
  final int id;
  final String? name;

  Genres({required this.id, this.name});

  factory Genres.fromJson(Map<String, dynamic> data) {
    final id = data['id'];
    final name = data['name'];
    return Genres(id: id, name: name);
  }
}
