import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/ui/pages/detail/detail_page.dart';
import 'home_view_model.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(homeViewModelProvider.notifier).loadMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewModelProvider);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            buildSectionTitle('가장 인기있는'),
            if (state.popularMovies.isNotEmpty)
              buildMainImage(context, state.popularMovies[0]),
            buildSectionTitle('현재 상영중'),
            buildHorizontalImageList(
              context,
              state.nowPlayingMovies,
              'now_playing',
            ),
            buildSectionTitle('인기순'),
            buildRankedImageList(context, state.popularMovies),
            buildSectionTitle('평점 높은 순'),
            buildHorizontalImageList(
              context,
              state.topRatedMovies,
              'top_rated',
            ),
            buildSectionTitle('개봉예정'),
            buildHorizontalImageList(context, state.upcomingMovies, 'upcoming'),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  Widget buildMainImage(BuildContext context, dynamic movie) {
    String imageUrl =
        'https://image.tmdb.org/t/p/w500${movie.backdropPath ?? movie.posterPath ?? ''}';
    String tag = 'main_image_${movie.id}';
    return GestureDetector(
      onTap: () => navigateToDetail(context, imageUrl, tag, movie.id),
      child: Container(
        height: 300,
        padding: const EdgeInsets.all(15),
        child: Hero(
          tag: tag,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[900],
                  child: const Center(
                    child: Icon(Icons.movie, size: 50, color: Colors.white54),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHorizontalImageList(
    BuildContext context,
    List<dynamic> movies,
    String category,
  ) {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        itemCount: movies.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 10),
        separatorBuilder: (_, __) => SizedBox(width: 5),
        itemBuilder: (context, index) {
          final movie = movies[index];
          String tag = '${category}_${movie.id}';
          String imageUrl =
              'https://image.tmdb.org/t/p/w500${movie.posterPath ?? ''}';
          return GestureDetector(
            onTap: () => navigateToDetail(context, imageUrl, tag, movie.id),
            child: Hero(
              tag: tag,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[900],
                      child: const Center(
                        child: Icon(
                          Icons.movie,
                          size: 30,
                          color: Colors.white54,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildRankedImageList(BuildContext context, List<dynamic> movies) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        itemCount: movies.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => SizedBox(width: 5),
        padding: EdgeInsets.only(left: 30),
        itemBuilder: (context, index) {
          final movie = movies[index];
          String tag = 'ranked_${movie.id}';
          String imageUrl =
              'https://image.tmdb.org/t/p/w500${movie.posterPath ?? ''}';
          return GestureDetector(
            onTap: () => navigateToDetail(context, imageUrl, tag, movie.id),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Hero(
                  tag: tag,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[900],
                          child: const Center(
                            child: Icon(
                              Icons.movie,
                              size: 30,
                              color: Colors.white54,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: -15,
                  left: -30,
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void navigateToDetail(
    BuildContext context,
    String imageUrl,
    String tag,
    int movieId,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => DetailPage(imageUrl: imageUrl, tag: tag, movieId: movieId),
      ),
    );
  }
}
