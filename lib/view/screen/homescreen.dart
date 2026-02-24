import 'package:flutter/material.dart';
import 'package:movies_project_api/core/app_color.dart';
import 'package:movies_project_api/model/topbar_modell.dart';
import 'package:movies_project_api/service/service.dart';
import 'package:movies_project_api/view/widget/topbarWidget.dart';


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
      body: FutureBuilder<List<TopbarModell>>(
        future: service.fetchtopbarmovie(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final movies = snapshot.data ?? [];

          return Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: AppColor.splashGradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
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

                
                  NowShowingCarousel(movies: movies),
                  SizedBox(height: 20,),
                  Text("Trending Movies",style: TextStyle(
                     color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                  ),),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}