class Credits {
  final int id;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final String character;

  final int order;

  Credits({
    required this.id,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    required this.character,
    required this.order,
  });

  factory Credits.fromJson(Map<String, dynamic> data) {
    return Credits(
      id: data['id'],
      name: data['name'],
      originalName: data['original_name'],
      popularity: data['popularity'],
      profilePath: data['profile_path'],
      character: data['character'],
      order: data['order'],
    );
  }
}
