import 'package:flutter/material.dart';
import 'package:movies_project_api/core/app_color.dart';
import 'package:movies_project_api/service/service.dart';
import 'package:movies_project_api/view/widget/movielistloading.dart';
import 'package:movies_project_api/view/widget/now_showing_corsul.dart';
import 'package:movies_project_api/view/widget/trendingwidget.dart';
import 'package:movies_project_api/view/widget/tvshowwidget.dart';
import 'package:movies_project_api/view/widget/upcomingwidget.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieService service = MovieService();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        title: const Text("MOVIE HUB"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: AppColor.splashGradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),

                const Text(
                  "Now Showing",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                FutureBuilder(
                  future: service.fetchtopbarmovie(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return MovieListLoading();
                    }

                    final movies = snapshot.data ?? [];
                    return NowShowingCarousel(movies: movies);
                  },
                ),

                const SizedBox(height: 30),

                const Text(
                  "Trending Movies",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                FutureBuilder(
                  future: service.fetchtrendingmovie(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return MovieListLoading();
                    }

                    final trendingMovies = snapshot.data ?? [];
                    return Trendingwidget(movies: trendingMovies);
                  },
                ),
                const SizedBox(height: 30),
                Text(
                  "upcoming movies",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                FutureBuilder(
                  future: service.fetchupcomingmovie(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return MovieListLoading();
                    }

                    final upcomingmovies = snapshot.data ?? [];
                    return Upcomingwidget(movies: upcomingmovies);
                  },
                ),
                SizedBox(height: 30),
                Text(
                  "Tv shows",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20,),
                FutureBuilder(
                  future: service.fetchtvshowmovie(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return MovieListLoading();
                    }

                    final upcomingmovies = snapshot.data ?? [];
                    return Tvshowwidget(movies: upcomingmovies);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
