import 'package:flutter/material.dart';
import 'package:movies_project_api/core/favorite_storage.dart';
import 'package:movies_project_api/model/favorite_trending_model.dart';

class FavoriteProvider extends ChangeNotifier {
  List<FavoriteModel> get favorites => FavoriteStorage.favorites;

  void add(FavoriteModel movie) {
    FavoriteStorage.add(movie);
    notifyListeners();
  }

  void remove(FavoriteModel movie) {
    FavoriteStorage.remove(movie);
    notifyListeners();
  }
}