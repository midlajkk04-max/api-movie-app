import 'package:dio/dio.dart';
import 'package:movies_project_api/core/url_movie.dart';
import 'package:movies_project_api/model/topbar_model.dart';
import 'package:movies_project_api/model/topbar_modell.dart';

class MovieService{
  Dio dio =Dio();

  Future <List<TopbarModell>> fetchtopbarmovie()async{
    final Response= await dio.get(UrlMovie.topbar);

    if(Response.statusCode == 200 && Response.data !=null){
      final  model =Topbar.fromjson(Response.data);
      return model.results ?? [];
    }else{
      throw Exception("Failed to load trending movies");
    }
  }
}