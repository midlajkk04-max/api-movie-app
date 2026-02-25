import 'package:flutter/material.dart';
import 'package:movies_project_api/model/topbar_modell.dart';
import 'package:movies_project_api/service/service.dart';

class SearchProvider extends ChangeNotifier {
  final MovieService service = MovieService();

  List<TopbarModell> movies = [];
  bool isLoading = false;

  Future<void> loadDefaultMovies() async {
    isLoading = true;
    notifyListeners();

    final result = await service.searchMovies("a");

    movies = result;
    isLoading = false;
    notifyListeners();
  }

  Future<void> searchMovie(String query) async {
    if (query.isEmpty) {
      loadDefaultMovies();
      return;
    }

    isLoading = true;
    notifyListeners();

    final result = await service.searchMovies(query);

    movies = result;
    isLoading = false;
    notifyListeners();
  }

  void clear(TextEditingController controller) {
    controller.clear();
    loadDefaultMovies();
  }
}