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

  Future<FavoriteMovie?> getByIdAndUserId(int id, String userId) async {
    var box = await Hive.openBox<FavoriteMovie>(favoriteHiveBox);
    for (var movie in box.values) {
      if (movie.id == id && movie.userId == userId) {
        return movie;
      }
    }
    return null;
  }

  Future<bool> existFavorite(int id, String userId) async {
    var box = await Hive.openBox<FavoriteMovie>(favoriteHiveBox);
    for (var movie in box.values) {
      if (movie.id == id && movie.userId == userId) {
        return true;
      }
    }
    return false;
  }

  Future<void> deleteFavorite(int id, String userId) async {
    var box = await Hive.openBox<FavoriteMovie>(favoriteHiveBox);
    final key = box.keys.firstWhere((k) {
      final item = box.get(k) as FavoriteMovie;
      return item.id == id && item.userId == userId;
    }, orElse: () => null);

    if (key != null) {
      await box.delete(key);
    }
  }
}
