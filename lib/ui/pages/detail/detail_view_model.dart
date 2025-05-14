import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/data/model/movie_detail.dart';
import 'package:movie_info_app/data/repository/movie_repository.dart';

final detailViewModelProvider =
    StateNotifierProvider<DetailViewModel, DetailState>((ref) {
      return DetailViewModel(ref.watch(movieRepositoryProvider));
    });

class DetailState {
  final MovieDetail? movieDetails;
  final bool isLoading;
  final String? error;

  DetailState({this.movieDetails, this.isLoading = false, this.error});

  DetailState copyWith({
    MovieDetail? movieDetails,
    bool? isLoading,
    String? error,
  }) {
    return DetailState(
      movieDetails: movieDetails ?? this.movieDetails,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class DetailViewModel extends StateNotifier<DetailState> {
  final MovieRepository _repository;

  DetailViewModel(this._repository) : super(DetailState());

  Future<void> loadMovieDetails(int movieId) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final details = await _repository.getMovieDetails(movieId);
      state = state.copyWith(movieDetails: details, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }
}
