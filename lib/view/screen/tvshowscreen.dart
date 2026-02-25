import 'package:flutter/material.dart';
import 'package:movies_project_api/core/app_color.dart';
import 'package:movies_project_api/core/url_movie.dart';
import 'package:movies_project_api/model/trending_model.dart';
import 'package:movies_project_api/model/tvshow_model.dart';

class Tvshowscreen extends StatelessWidget {
  final TvshowModel movie;

  const Tvshowscreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
         
          SizedBox(
            width: double.infinity,
            height: height * 0.6,
            child: Image.network(
              "${Url.imageBaseUrl}${movie.poster_path}",
              fit: BoxFit.cover,
            ),
          ),

        
          Container(
            height: height * 0.6,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

        
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.55),

                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: AppColor.splashGradient,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    
                      Text(
                        movie.title ?? "",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                    
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          const SizedBox(width: 5),
                          Text(
                            movie.vote_average?.toString() ?? "0",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Overview",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        movie.overview ?? "No description available",
                        style: const TextStyle(
                          color: Colors.white70,
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 250),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}