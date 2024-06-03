import 'package:hive/hive.dart';

class FavoriteMovie {
  int id;
  String userId;
  double popularity;
  String title;
  String overview;
  String postPathLocal;
  String posterPath;
  double voteAverage;
  int voteCount;

  FavoriteMovie(
      this.id,
      this.userId,
      this.popularity,
      this.title,
      this.overview,
      this.postPathLocal,
      this.posterPath,
      this.voteAverage,
      this.voteCount);
}

class FavoriteAdapter extends TypeAdapter<FavoriteMovie> {
  @override
  final typeId = 0;

  @override
  FavoriteMovie read(BinaryReader reader) {
    var id = reader.read();
    var userId = reader.read();
    var popularity = reader.read();
    var title = reader.read();
    var overview = reader.read();
    var postPathLocal = reader.read();
    var posterPath = reader.read();
    var voteAverage = reader.read();
    var voteCount = reader.read();
    return FavoriteMovie(id, userId, popularity, title, overview, postPathLocal,
        posterPath, voteAverage, voteCount);
  }

  @override
  void write(BinaryWriter writer, FavoriteMovie obj) {
    writer.write(obj.id);
    writer.write(obj.userId);
    writer.write(obj.popularity);
    writer.write(obj.title);
    writer.write(obj.overview);
    writer.write(obj.postPathLocal);
    writer.write(obj.posterPath);
    writer.write(obj.voteAverage);
    writer.write(obj.voteCount);
  }
}
