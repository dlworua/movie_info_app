import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/model/movie.dart';
import '../../../domain/usecase/get_movie_detail_usecase.dart';
import '../providers/use_case_providers.dart';

final detailViewModelProvider =
    StateNotifierProvider<DetailViewModel, DetailState>((ref) {
      return DetailViewModel(
        getMovieDetailUseCase: ref.watch(getMovieDetailUseCaseProvider),
      );
    });

class DetailState {
  final Movie? movie;

  DetailState({this.movie});

  DetailState copyWith({Movie? movie}) {
    return DetailState(movie: movie ?? this.movie);
  }
}

class DetailViewModel extends StateNotifier<DetailState> {
  final GetMovieDetailUseCase getMovieDetailUseCase;

  DetailViewModel({required this.getMovieDetailUseCase}) : super(DetailState());

  Future<void> loadMovieDetail(int movieId) async {
    final movie = await getMovieDetailUseCase(movieId);
    state = state.copyWith(movie: movie);
  }
}
