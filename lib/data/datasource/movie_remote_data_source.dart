import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final movieRemoteDataSourceProvider = Provider<MovieRemoteDataSource>((ref) {
  return MovieRemoteDataSource();
});

class MovieRemoteDataSource {
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  static const String _apiKey =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4N2NjMGQyYWY4NzI0YTUwYzY4ZjhlNTVlYjhkMzdhYSIsIm5iZiI6MS43NDcxMjA5Nzg3MTI5OTk4ZSs5LCJzdWIiOiI2ODIyZjM1MjY1ZDBjOGYzYmUyZDFmMzEiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.k4RX65-MAI8gTqjV9NRFGA5YhusbGIeASX2o1FjRcRI'; // TMDB API 키를 여기에 입력하세요

  Future<Map<String, dynamic>> getMovieDetails(int movieId) async {
    // https://api.themoviedb.org/3/movie/1241436?language=en-US
    final response = await http.get(
      Uri.parse(
        '$_baseUrl/movie/$movieId?api_key=$_apiKey&append_to_response=images',
      ),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}
