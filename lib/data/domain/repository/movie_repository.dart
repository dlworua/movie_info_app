// 인터페이스만들기
import 'package:movie_info_app/data/domain/entity/movie_details.dart';

abstract interface class MovieRepository {
  Future<List<Movie>> fetchMovies();
}
