import '../model/movie.dart';
import '../repository/movie_repository.dart';

class GetMovieDetailUseCase {
  final MovieRepository repository;

  GetMovieDetailUseCase(this.repository);

  Future<Movie> call(int movieId) async {
    return await repository.getMovieDetail(movieId);
  }
}
