import '../model/movie.dart';
import '../repository/movie_repository.dart';

class GetTopRatedMoviesUseCase {
  final MovieRepository _repository;

  GetTopRatedMoviesUseCase({required MovieRepository repository})
    : _repository = repository;

  Future<List<Movie>> call() async {
    return _repository.getTopRatedMovies();
  }
}
