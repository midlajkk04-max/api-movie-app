import 'package:movies_project_api/model/upcoming_model.dart';

class UpcomingModell {
   final int? page;
  final List<UpcomingModel>? results;
  final int? totalPages;
  final int? totalResults;

  UpcomingModell({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory UpcomingModell.fromJson(Map<String, dynamic> json) {
    return UpcomingModell(
      page: json["page"] ?? 0,
      results:
          (json["results"] as List<dynamic>?)
              ?.map((e) => UpcomingModel.fromjson(e))
              .toList() ??
          [],
      totalPages: json["total_pages"] ?? 0,
      totalResults: json["total_results"] ?? 0,
    );
  }
}