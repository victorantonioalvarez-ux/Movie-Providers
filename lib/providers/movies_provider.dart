import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/models/now_playing_response.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print("Movies Provide inicialitzat!");
    getOnDisplayMovies();
  }

  String _baseURL = "api.themoviedb.org";
  String _APIKey = "5cbf29845ebab3a961bccb9cdacea9be";
  String _language = "es-ES";
  String _page = "1";

  List<Movie> onDisplayMovies = [];

  getOnDisplayMovies() async {
    print("getOnDisplayMovies");
    var url =
        Uri.https(_baseURL, '3/movie/now_playing', {
          'api_key': _APIKey,
          'language': _language,
          'page': _page
          });
  
    // Await the http get response, then decode the json-formatted response.
    final result = await http.get(url);

    final nowPlayingResponse = NowPlayingResponse.fromJson(result.body);
  
    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }
}
