import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/data/model/movie_detail.dart';
import 'package:movie_info_app/data/repository/movie_repository.dart';

final detailViewModelProvider = NotifierProvider.autoDispose
    .family<DetailViewModel, DetailState, int>(() {
      return DetailViewModel();
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

class DetailViewModel extends AutoDisposeFamilyNotifier<DetailState, int> {
  late final MovieRepository _repository = ref.read(movieRepositoryProvider);

  Future<void> loadMovieDetails(int movieId) async {
    try {
      final details = await _repository.getMovieDetails(movieId);
      state = state.copyWith(movieDetails: details, isLoading: false);
    } catch (e) {
      print(e);
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  @override
  DetailState build(int arg) {
    loadMovieDetails(arg);
    return DetailState(isLoading: true);
  }
}
