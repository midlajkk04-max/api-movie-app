import 'package:movies_project_api/model/favorite_trending_model.dart';

class FavoriteStorage {
  static List<FavoriteModel> favorites = [];

  static void add(FavoriteModel item) {
    favorites.add(item);
  }

  static void remove(FavoriteModel item) {
    favorites.remove(item);
  }
}