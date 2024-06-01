class Favorite {
  final String fileName;
  final String urlFile;

  Favorite({required this.fileName, required this.urlFile});

  factory Favorite.fromJson(Map<String, dynamic> data) {
    return Favorite(fileName: data['fileName'], urlFile: data['urlFile']);
  }
}
