import 'package:hive/hive.dart';

class FavoriteMovie {
  int id;
  double popularity;
  String title;
  String postPathLocal;
  String posterPath;
  double voteAverage;
  int voteCount;

  FavoriteMovie(this.id, this.popularity, this.title, this.postPathLocal,
      this.posterPath, this.voteAverage, this.voteCount);
}

class FavoriteAdapter extends TypeAdapter<FavoriteMovie> {
  @override
  final typeId = 0;

  @override
  FavoriteMovie read(BinaryReader reader) {
    var id = reader.read();
    var popularity = reader.read();
    var title = reader.read();
    var postPathLocal = reader.read();
    var posterPath = reader.read();
    var voteAverage = reader.read();
    var voteCount = reader.read();
    return FavoriteMovie(id, popularity, title, postPathLocal, posterPath,
        voteAverage, voteCount);
  }

  @override
  void write(BinaryWriter writer, FavoriteMovie obj) {
    writer.write(obj.id);
    writer.write(obj.popularity);
    writer.write(obj.title);
    writer.write(obj.postPathLocal);
    writer.write(obj.posterPath);
    writer.write(obj.voteAverage);
    writer.write(obj.voteCount);
  }
}
