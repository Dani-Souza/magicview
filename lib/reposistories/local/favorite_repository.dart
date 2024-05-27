import 'package:hive_flutter/hive_flutter.dart';
import 'package:magicview/entities/favorite_movie.dart';

class FavoriteRepository {
  final String favoriteHiveBox = 'favoriteBox';

  Future<void> addOrUpdateFavorite(FavoriteMovie movie) async {
    var box = await Hive.openBox<FavoriteMovie>(favoriteHiveBox);
    await box.put(movie.id, movie);
  }

  Future<List<FavoriteMovie>> getAllFavorites() async {
    var box = await Hive.openBox<FavoriteMovie>(favoriteHiveBox);
    return box.values.toList();
  }

  Future<FavoriteMovie?> getByIdFavorite(int id) async {
    var box = await Hive.openBox<FavoriteMovie>(favoriteHiveBox);
    return box.get(id);
  }

  Future<void> deleteFavorite(int id) async {
    var box = await Hive.openBox<FavoriteMovie>(favoriteHiveBox);
    await box.delete(id);
  }
}
