import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final movieRemoteDataSourceProvider = Provider<MovieRemoteDataSource>((ref) {
  return MovieRemoteDataSource();
});

class MovieRemoteDataSource {
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  static const String _apiKey = 'YOUR_API_KEY'; // TMDB API 키를 여기에 입력하세요

  Future<Map<String, dynamic>> getMovieDetails(int movieId) async {
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
