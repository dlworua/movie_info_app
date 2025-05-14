import '../model/movie.dart';
import '../repository/movie_repository.dart';

class GetUpcomingMoviesUseCase {
  final MovieRepository _repository;

  GetUpcomingMoviesUseCase({required MovieRepository repository})
    : _repository = repository;

  Future<List<Movie>> call() async {
    return _repository.getUpcomingMovies();
  }
}
