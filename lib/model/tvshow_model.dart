class TvshowModel {
  final int? id;
  final String? title;
  final String? overview;
  final String? poster_path;
  final String? release_date;
  final double? vote_average;

  TvshowModel({
    this.id,
    this.title,
    this.overview,
    this.poster_path,
    this.release_date,
    this.vote_average,
  });
  factory TvshowModel.fromjson(Map<String, dynamic> json) {
    return TvshowModel(
      id: json["id"],
      title: json["title"],
      overview: json["overview"],
      poster_path: json["poster_path"],
      release_date: json["release_date"],
      vote_average: (json["vote_average"] ?? 0).toDouble(),
    );
  }
}