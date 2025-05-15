import 'package:movie_info_app/data/data_source/movie_data_source.dart';
import 'package:movie_info_app/data/domain/entity/movie_details.dart';
import 'package:movie_info_app/data/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._movieDataSource);

  final MovieDataSource _movieDataSource;

  @override
  Future<List<Movie>> fetchMovies() async {
    final result = await _movieDataSource.fetchMovies();
    return result
        .map(
          (e) => Movie(
            title: e.title,
            releaseDate: e.releaseDate,
            overview: e.overview,
            posterPath: e.posterPath,
            voteAverage: e.voteAverage,
          ),
        )
        .toList();
  }
}
