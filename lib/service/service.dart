import 'package:dio/dio.dart';
import 'package:movies_project_api/core/url_movie.dart';
import 'package:movies_project_api/model/topbar_model.dart';
import 'package:movies_project_api/model/topbar_modell.dart';
import 'package:movies_project_api/model/trending_model.dart';
import 'package:movies_project_api/model/trending_modell.dart';
import 'package:movies_project_api/model/tvshow_model.dart';
import 'package:movies_project_api/model/tvshow_modell.dart';
import 'package:movies_project_api/model/upcoming_model.dart';
import 'package:movies_project_api/model/upcoming_modell.dart';

class MovieService {
  Dio dio = Dio();

  Future<List<TopbarModell>> fetchtopbarmovie() async {
    final Response = await dio.get(Url.topbar);

    if (Response.statusCode == 200 && Response.data != null) {
      final model = Topbar.fromjson(Response.data);
      return model.results ?? [];
    } else {
      throw Exception("Failed to load trending movies");
    }
  }

  Future<List<TrendingModel>> fetchtrendingmovie() async {
    final response = await dio.get(Url.trending);
    if (response.statusCode == 200 && response.data != null) {
      final data = TrendingModell.fromJson(response.data);

      return data.results ?? [];
    } else {
      throw Exception("Failed to load movies");
    }
  }
 Future<List<UpcomingModel>>fetchupcomingmovie()async{
  final response =await dio.get(Url.upcoming);
  if(response.statusCode == 200 && response.data != null){
    final data = UpcomingModell.fromJson(response.data);
    return data.results ?? [];

  }else{
    throw Exception("Failed to load movies");
  }
 }
 Future<List<TvshowModel>>fetchtvshowmovie()async{
  final response =await dio.get(Url.tvShow);
  if(response.statusCode ==200 && response.data!= null){
    final data = TvshowModell.fromJson(response.data);
    return data.results ?? [];
  }else{
    throw Exception("Failed to load movies");
  }
 }
}
