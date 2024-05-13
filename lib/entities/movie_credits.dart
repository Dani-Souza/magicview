class MovieCredits {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;

  MovieCredits({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });

  factory MovieCredits.fromJson(Map<String, dynamic> data) {
    return MovieCredits(
      adult: data['adult'],
      gender: data['gender'],
      id: data['id'],
      knownForDepartment: data['known_for_department'],
      name: data['name'],
      originalName: data['original_name'],
      popularity: data['popularity'],
      profilePath: data['profile_path'],
      castId: data['cast_id'],
      character: data['character'],
      creditId: data['credit_id'],
      order: data['order'],
    );
  }
}
