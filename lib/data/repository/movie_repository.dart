import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/data/model/movie_detail.dart';
import 'package:movie_info_app/data/datasource/movie_remote_data_source.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  return MovieRepository(ref.watch(movieRemoteDataSourceProvider));
});

class MovieRepository {
  final MovieRemoteDataSource _dataSource;

  MovieRepository(this._dataSource);

  Future<MovieDetail> getMovieDetails(int movieId) async {
    final response = await _dataSource.getMovieDetails(movieId);
    return MovieDetail.fromJson(response);
  }
}
