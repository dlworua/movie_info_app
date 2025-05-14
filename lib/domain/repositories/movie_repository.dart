import '../entities/movie.dart';

abstract class MovieRepository {
  Future<Movie> getMovieDetails(int movieId);
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> searchMovies(String query);
}
