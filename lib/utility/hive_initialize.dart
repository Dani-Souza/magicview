import 'package:hive_flutter/hive_flutter.dart';
import 'package:magicview/entities/favorite_movie.dart';

class HiveInitialize {
  static initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(FavoriteAdapter());

    return await Hive.openBox<FavoriteMovie>('favoriteBox');
  }
}
