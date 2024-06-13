import 'dart:convert';
import 'package:anime/Repository/ModelClass/Anime.dart';
import 'package:http/http.dart';
import 'api_client.dart';


class AnimeApi {
  ApiClient apiClient = ApiClient();


  Future<AnimeModel> getAnime() async {
    String trendingpath = 'https://anime-db.p.rapidapi.com/anime?page=1&size=10&search=Fullmetal&genres=Fantasy%2CDrama&sortBy=ranking&sortOrder=asc';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return AnimeModel.fromJson(jsonDecode(response.body));
  }
}