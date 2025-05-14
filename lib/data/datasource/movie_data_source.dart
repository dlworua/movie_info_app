import '../../domain/model/movie.dart';

abstract class MovieDataSource {
  Future<List<Movie>> fetchNowPlayingMovies();

  Future<List<Movie>> fetchPopularMovies();

  Future<List<Movie>> fetchTopRatedMovies();

  Future<List<Movie>> fetchUpcomingMovies();

  Future<Movie> fetchMovieDetail(int movieId);
}
