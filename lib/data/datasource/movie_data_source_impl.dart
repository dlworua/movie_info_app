import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../core/config/env_config.dart';
import '../../domain/model/movie.dart';
import 'movie_data_source.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final http.Client _client;
  final String _baseUrl;
  final String _apiKey;

  MovieDataSourceImpl({
    required http.Client client,
    String? baseUrl,
    String? apiKey,
  }) : _client = client,
       _baseUrl = baseUrl ?? EnvConfig.baseUrl,
       _apiKey = apiKey ?? EnvConfig.apiKey;

  @override
  Future<List<Movie>> fetchNowPlayingMovies() async {
    final response = await _client.get(
      Uri.parse('$_baseUrl/movie/now_playing?api_key=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['results'] as List)
          .map((json) => Movie.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load now playing movies');
    }
  }

  @override
  Future<List<Movie>> fetchPopularMovies() async {
    final response = await _client.get(
      Uri.parse('$_baseUrl/movie/popular?api_key=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['results'] as List)
          .map((json) => Movie.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load popular movies');
    }
  }

  @override
  Future<List<Movie>> fetchTopRatedMovies() async {
    final response = await _client.get(
      Uri.parse('$_baseUrl/movie/top_rated?api_key=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['results'] as List)
          .map((json) => Movie.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load top rated movies');
    }
  }

  @override
  Future<List<Movie>> fetchUpcomingMovies() async {
    final response = await _client.get(
      Uri.parse('$_baseUrl/movie/upcoming?api_key=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['results'] as List)
          .map((json) => Movie.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }

  @override
  Future<Movie> fetchMovieDetail(int movieId) async {
    final response = await _client.get(
      Uri.parse('$_baseUrl/movie/$movieId?api_key=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Movie.fromJson(data);
    } else {
      throw Exception('Failed to load movie detail');
    }
  }
}
