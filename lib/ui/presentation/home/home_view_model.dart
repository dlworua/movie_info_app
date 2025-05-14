import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/model/movie.dart';
import '../../../domain/usecase/get_now_playing_movies_usecase.dart';
import '../../../domain/usecase/get_popular_movies_usecase.dart';
import '../../../domain/usecase/get_top_rated_movies_usecase.dart';
import '../../../domain/usecase/get_upcoming_movies_usecase.dart';
import '../providers/use_case_providers.dart';

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeState>((
  ref,
) {
  return HomeViewModel(
    getNowPlayingMoviesUseCase: ref.watch(getNowPlayingMoviesUseCaseProvider),
    getPopularMoviesUseCase: ref.watch(getPopularMoviesUseCaseProvider),
    getTopRatedMoviesUseCase: ref.watch(getTopRatedMoviesUseCaseProvider),
    getUpcomingMoviesUseCase: ref.watch(getUpcomingMoviesUseCaseProvider),
  );
});

class HomeState {
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final List<Movie> upcomingMovies;

  HomeState({
    this.nowPlayingMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.upcomingMovies = const [],
  });

  HomeState copyWith({
    List<Movie>? nowPlayingMovies,
    List<Movie>? popularMovies,
    List<Movie>? topRatedMovies,
    List<Movie>? upcomingMovies,
  }) {
    return HomeState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
    );
  }
}

class HomeViewModel extends StateNotifier<HomeState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  final GetUpcomingMoviesUseCase getUpcomingMoviesUseCase;

  HomeViewModel({
    required this.getNowPlayingMoviesUseCase,
    required this.getPopularMoviesUseCase,
    required this.getTopRatedMoviesUseCase,
    required this.getUpcomingMoviesUseCase,
  }) : super(HomeState());

  Future<void> loadMovies() async {
    final nowPlayingMovies = await getNowPlayingMoviesUseCase();
    final popularMovies = await getPopularMoviesUseCase();
    final topRatedMovies = await getTopRatedMoviesUseCase();
    final upcomingMovies = await getUpcomingMoviesUseCase();

    state = state.copyWith(
      nowPlayingMovies: nowPlayingMovies,
      popularMovies: popularMovies,
      topRatedMovies: topRatedMovies,
      upcomingMovies: upcomingMovies,
    );
  }
}
