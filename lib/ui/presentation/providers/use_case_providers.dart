import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecase/get_now_playing_movies_usecase.dart';
import '../../../domain/usecase/get_popular_movies_usecase.dart';
import '../../../domain/usecase/get_top_rated_movies_usecase.dart';
import '../../../domain/usecase/get_upcoming_movies_usecase.dart';
import '../../../domain/usecase/get_movie_detail_usecase.dart';
import '../../../data/repository/movie_repository_impl.dart';
import '../../../data/datasource/movie_data_source_impl.dart';
import 'package:http/http.dart' as http;

final movieDataSourceProvider = Provider<MovieDataSourceImpl>((ref) {
  return MovieDataSourceImpl(client: http.Client());
});

final movieRepositoryProvider = Provider<MovieRepositoryImpl>((ref) {
  return MovieRepositoryImpl(ref.watch(movieDataSourceProvider));
});

final getNowPlayingMoviesUseCaseProvider = Provider<GetNowPlayingMoviesUseCase>(
  (ref) {
    return GetNowPlayingMoviesUseCase(
      repository: ref.watch(movieRepositoryProvider),
    );
  },
);

final getPopularMoviesUseCaseProvider = Provider<GetPopularMoviesUseCase>((
  ref,
) {
  return GetPopularMoviesUseCase(
    repository: ref.watch(movieRepositoryProvider),
  );
});

final getTopRatedMoviesUseCaseProvider = Provider<GetTopRatedMoviesUseCase>((
  ref,
) {
  return GetTopRatedMoviesUseCase(
    repository: ref.watch(movieRepositoryProvider),
  );
});

final getUpcomingMoviesUseCaseProvider = Provider<GetUpcomingMoviesUseCase>((
  ref,
) {
  return GetUpcomingMoviesUseCase(
    repository: ref.watch(movieRepositoryProvider),
  );
});

final getMovieDetailUseCaseProvider = Provider<GetMovieDetailUseCase>((ref) {
  return GetMovieDetailUseCase(ref.watch(movieRepositoryProvider));
});
