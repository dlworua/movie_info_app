import '../model/movie.dart';
import '../repository/movie_repository.dart';

class GetPopularMoviesUseCase {
  final MovieRepository _repository;

  GetPopularMoviesUseCase({required MovieRepository repository})
    : _repository = repository;

  Future<List<Movie>> call() async {
    return _repository.getPopularMovies();
  }
}
