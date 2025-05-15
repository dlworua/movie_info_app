import 'package:movie_info_app/data/domain/entity/movie_details.dart';
import 'package:movie_info_app/data/domain/repository/movie_repository.dart';

class FetchMoviesUsecase {
  FetchMoviesUsecase(this.movieRepository);
  final MovieRepository movieRepository;

  Future<List<Movie>> execute() async {
    return await movieRepository.fetchMovies();
  }
}
