import '../../domain/model/movie.dart';
import '../../domain/repository/movie_repository.dart';
import '../datasource/movie_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource dataSource;

  MovieRepositoryImpl(this.dataSource);

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    return await dataSource.fetchNowPlayingMovies();
  }

  @override
  Future<List<Movie>> getPopularMovies() async {
    return await dataSource.fetchPopularMovies();
  }

  @override
  Future<List<Movie>> getTopRatedMovies() async {
    return await dataSource.fetchTopRatedMovies();
  }

  @override
  Future<List<Movie>> getUpcomingMovies() async {
    return await dataSource.fetchUpcomingMovies();
  }

  @override
  Future<Movie> getMovieDetail(int movieId) async {
    return await dataSource.fetchMovieDetail(movieId);
  }
}
