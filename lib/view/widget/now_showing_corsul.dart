import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_project_api/core/url_movie.dart';
import 'package:movies_project_api/model/topbar_modell.dart';

class NowShowingCarousel extends StatelessWidget {
  final List<TopbarModell> movies;

  const NowShowingCarousel({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: movies.length,
      itemBuilder: (context, index, realIndex) {
        final movie = movies[index];

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: AspectRatio(
              aspectRatio: 6 / 2,
              child: Image.network(
                "${Url.imageBaseUrl}${movie.poster_path}",
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 260,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.6,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
      ),
    );
  }
}
