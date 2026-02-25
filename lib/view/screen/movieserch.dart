import 'package:flutter/material.dart';
import 'package:movies_project_api/controller/serch_controller.dart';
import 'package:movies_project_api/core/app_color.dart';
import 'package:movies_project_api/core/url_movie.dart';
import 'package:provider/provider.dart';

class Movieserch extends StatefulWidget {
  const Movieserch({super.key});

  @override
  State<Movieserch> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<Movieserch> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => context.read<SearchProvider>().loadDefaultMovies(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: AppColor.bgColor,
          appBar: AppBar(
            backgroundColor: AppColor.bgColor,
            title: const Text("Search"),
          ),
          body: CustomScrollView(
            slivers: [
              /// 🔍 SEARCH FIELD
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextField(
                    controller: controller,
                    style: const TextStyle(color: Colors.white),
                    onChanged: (value) {
                      provider.searchMovie(value);
                      setState(() {}); // suffix icon update
                    },
                    decoration: InputDecoration(
                      hintText: "Search movies...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon:
                          const Icon(Icons.search, color: Colors.white),
                      suffixIcon: controller.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.close,
                                  color: Colors.white),
                              onPressed: () {
                                provider.clear(controller);
                                setState(() {});
                              },
                            )
                          : null,
                      filled: true,
                      fillColor: AppColor.cardColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),

              /// ⏳ LOADING
              if (provider.isLoading)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )

              /// ❌ EMPTY
              else if (provider.movies.isEmpty)
                const SliverFillRemaining(
                  child: Center(
                    child: Text(
                      "No Movies Found",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )

              /// 🎬 MOVIE GRID
              else
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final movie = provider.movies[index];

                        return Container(
                          decoration: BoxDecoration(
                            color: AppColor.cardColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius:
                                      const BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  ),
                                  child: movie.poster_path == null
                                      ? Container(
                                          color: Colors.grey.shade800,
                                          child: const Icon(
                                            Icons.movie,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        )
                                      : Image.network(
                                          "${Url.imageBaseUrl}${movie.poster_path}",
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Container(
                                              color:
                                                  Colors.grey.shade800,
                                              child: const Icon(
                                                Icons.broken_image,
                                                color: Colors.white,
                                                size: 40,
                                              ),
                                            );
                                          },
                                        ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      childCount: provider.movies.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .65,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}