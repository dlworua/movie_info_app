import '../model/movie.dart';
import '../repository/movie_repository.dart';

class GetNowPlayingMoviesUseCase {
  final MovieRepository _repository;

  GetNowPlayingMoviesUseCase({required MovieRepository repository})
    : _repository = repository;

  Future<List<Movie>> call() async {
    return _repository.getNowPlayingMovies();
  }
}
