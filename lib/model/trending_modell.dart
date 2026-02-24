import 'package:movies_project_api/model/trending_model.dart';

class TrendingModell {
  final int? page;
  final List<TrendingModel>? results;
  final int? totalPages;
  final int? totalResults;

  TrendingModell({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory TrendingModell.fromJson(Map<String, dynamic> json) {
    return TrendingModell(
      page: json["page"] ?? 0,
      results:
          (json["results"] as List<dynamic>?)
              ?.map((e) => TrendingModel.fromjson(e))
              .toList() ??
          [],
      totalPages: json["total_pages"] ?? 0,
      totalResults: json["total_results"] ?? 0,
    );
  }
}
