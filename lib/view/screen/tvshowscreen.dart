import 'package:flutter/material.dart';
import 'package:movies_project_api/core/url_movie.dart';
import 'package:movies_project_api/model/topbar_model.dart';
import 'package:movies_project_api/model/topbar_modell.dart';
import 'package:movies_project_api/model/trending_model.dart';
import 'package:movies_project_api/model/tvshow_model.dart';
import 'package:movies_project_api/model/upcoming_model.dart';

class Tvshowscreen extends StatelessWidget {
  final TvshowModel movie;

  const Tvshowscreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title ?? "")),
      body: Column(
        children: [
          Image.network(
            "${Url.imageBaseUrl}${movie.poster_path}",
          ),
          SizedBox(height: 20),
          Text(movie.title ?? ""),
          Text(movie.overview ?? ""),
        ],
      ),
    );
  }
}