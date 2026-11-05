import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print("Movies Provide inicialitzat!");
    this.getOnDisplayMovies();
  }

  String _baseURL = "api.themoviedb.org";
  String _APIKey = "337b0f0ceb642f99a5bb8297de788518";
  String _language = "es-ES";
  String _page = "1";

  getOnDisplayMovies() async {
    print("getOnDisplayMovies");
    var url =
        Uri.https(_baseURL, '3/movie/now_playing', {
          'api_key': _APIKey,
          'language': _language,
          'page': _page
          });

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['results'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
