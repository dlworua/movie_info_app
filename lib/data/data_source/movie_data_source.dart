import 'package:movie_info_app/data/dto/Movie_Detail_Dto.dart';
import 'package:movie_info_app/data/dto/Movie_Response_Dto.dart';

abstract interface class MovieDataSource {
  Future<List<MovieResponseDto>> fetchMovies();
}
