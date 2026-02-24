class UrlMovie {
  static const String baseurl = "https://api.themoviedb.org/3";
  static const String apikey = "f4492ca34ea902c5cb7a1ad2a401ded7";
    static const String imageBase = "https://image.tmdb.org/t/p/w500";
  static const String topbar = "$baseurl/movie/now_playing?api_key=$apikey";
  static const String trending = "$baseurl/trending/movie/day?api_key=$apikey";
  static const String upcoming = "$baseurl/movie/upcoming?api_key=$apikey";
  static const String tvshow = "$baseurl/tv/airing_today?api_key=$apikey";
}
