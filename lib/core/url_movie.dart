class Url {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  static const String apiKey = 'f4492ca34ea902c5cb7a1ad2a401ded7';
  static const String topbar = "$baseUrl/discover/movie?api_key=$apiKey";
  static const String trending = '$baseUrl/trending/movie/day?api_key=$apiKey';

  static const String upcoming = '$baseUrl/movie/upcoming?api_key=$apiKey';

  static const String tvShow = '$baseUrl/tv/airing_today?api_key=$apiKey';
  static const String searchMovie = "$baseUrl/search/movie";
} 
