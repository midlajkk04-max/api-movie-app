import 'package:flutter/material.dart';
import 'package:movies_project_api/core/url_movie.dart';
import 'package:movies_project_api/model/topbar_modell.dart';
import 'package:movies_project_api/model/trending_model.dart';
import 'package:movies_project_api/model/upcoming_model.dart';
import 'package:movies_project_api/view/screen/trendingscreen.dart';
import 'package:movies_project_api/view/screen/upcomingscreen.dart';


class Upcomingwidget extends StatelessWidget {
  final List<UpcomingModel> movies;

  const Upcomingwidget({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: movies.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final data = movies[index];

          return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Upcomingscreen(movie: data),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                "${Url.imageBaseUrl}${data.poster_path}",
                width: 130,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}