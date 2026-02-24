import 'package:movies_project_api/model/topbar_modell.dart';

class Topbar {
  final int ?page;
  final List<TopbarModell> ?results;
  final int? total_pages;
  final int ?total_results;

  Topbar({
     this.page,
     this.results,
     this.total_pages,
     this.total_results,
  });
  factory Topbar.fromjson(Map<String, dynamic> json) {
    return Topbar(
      page: json["page"],
     results: (json["results"] as List)
          .map((e) => TopbarModell.fromjson(e))
          .toList(),
      total_pages: json["total_pages"],
      total_results: json["total_results"],
    );
  }
}
