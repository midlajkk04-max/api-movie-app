import 'package:movies_project_api/model/tvshow_model.dart';

class TvshowModell {
   final int? page;
  final List<TvshowModel>? results;
  final int? totalPages;
  final int? totalResults;

  TvshowModell({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory TvshowModell.fromJson(Map<String, dynamic> json) {
    return TvshowModell(
      page: json["page"] ?? 0,
      results:
          (json["results"] as List<dynamic>?)
              ?.map((e) => TvshowModel.fromjson(e))
              .toList() ??
          [],
      totalPages: json["total_pages"] ?? 0,
      totalResults: json["total_results"] ?? 0,
    );
  }
}