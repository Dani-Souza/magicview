import 'package:hive_flutter/hive_flutter.dart';
import 'package:magicview/entities/favorite_movie.dart';

class FavoriteLocalRepository {
  final String favoriteHiveBox = 'favoriteBox';

  Future<void> addOrUpdateFavorite(FavoriteMovie movie) async {
    var box = await Hive.openBox<FavoriteMovie>(favoriteHiveBox);
    await box.put(movie.id, movie);
  }

  Future<List<FavoriteMovie>> getAllFavorites(String userId) async {
    var box = await Hive.openBox<FavoriteMovie>(favoriteHiveBox);
    return box.values.where((movie) => movie.userId == userId).toList();
  }

  Future<FavoriteMovie?> getByIdFavorite(int id) async {
    var box = await Hive.openBox<FavoriteMovie>(favoriteHiveBox);
    return box.get(id);
  }

  Future<bool> existFavorite(int id) async {
    var box = await Hive.openBox<FavoriteMovie>(favoriteHiveBox);
    return box.values.contains(id);
  }

  Future<void> deleteFavorite(int id) async {
    var box = await Hive.openBox<FavoriteMovie>(favoriteHiveBox);
    await box.delete(id);
  }
}
