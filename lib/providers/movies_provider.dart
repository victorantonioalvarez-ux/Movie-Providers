import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/models/now_playing_response.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print("Movies Provide inicialitzat!");
    this.getOnDisplayMovies();
  }

  String _baseURL = "api.themoviedb.org";
  String _APIKey = "337b0f0ceb642f99a5bb8297de788518";
  String _language = "en-US";
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

  }
}
