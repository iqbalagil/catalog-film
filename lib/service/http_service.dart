import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter_application_listmovie/models/movie.dart';

class HttpService {
  final String apiKey = 'a6dbd971254e201cdd7480c0e26bc66b';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<List<Movie>> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesList = jsonResponse['results'] as List<dynamic>;
      List<Movie> movies = moviesList.map((e) => Movie.fromJson(e)).toList();
      return movies;
    } else {
      print("Fail");
      return []; // Return an empty list if request fails
    }
  }
}
