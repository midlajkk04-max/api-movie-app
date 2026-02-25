import 'package:flutter/material.dart';
import 'package:movies_project_api/core/app_color.dart';
import 'package:movies_project_api/core/favorite_storage.dart';
import 'package:movies_project_api/core/url_movie.dart';
import 'package:movies_project_api/model/favorite_trending_model.dart';

class Favoritescreen extends StatefulWidget {
  const Favoritescreen({super.key});

  @override
  State<Favoritescreen> createState() => _FavoritescreenState();
}

class _FavoritescreenState extends State<Favoritescreen> {
  @override
  Widget build(BuildContext context) {
    List<FavoriteModel> favList = FavoriteStorage.favorites;

    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        title: const Text("Favorites"),
        backgroundColor: AppColor.bgColor,
      ),
      body: favList.isEmpty
          ? const Center(
              child: Text(
                "No Favorites Yet",
                style: TextStyle(color: Colors.white),
              ),
            )
          : ListView.builder(
              itemCount: favList.length,
              itemBuilder: (context, index) {
                final item = favList[index];

                return Container(
                  height: 110,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      
                      ClipRRect(
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(15),
                        ),
                        child: Image.network(
                          "${Url.imageBaseUrl}${item.posterPath}",
                          width: 90,
                          height: 110,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(width: 12),

                
                      Expanded(
                        child: Text(
                          item.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

          
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 26,
                        ),
                        onPressed: () {
                          setState(() {
                            FavoriteStorage.remove(item);
                          });
                        },
                      ),

                      const SizedBox(width: 8),
                    ],
                  ),
                );
              },
            ),
    );
  }
}