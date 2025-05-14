import 'package:flutter/material.dart';
import '../../../domain/model/movie.dart';
import 'movie_card.dart';

class MovieList extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  final bool showRanking;

  const MovieList({
    super.key,
    required this.title,
    required this.movies,
    this.showRanking = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return Padding(
                padding: EdgeInsets.only(left: showRanking ? 30 : 10),
                child:
                    showRanking
                        ? Stack(
                          clipBehavior: Clip.none,
                          children: [
                            MovieCard(
                              movieId: movie.id,
                              posterPath: movie.posterPath ?? '',
                              heroTag: '${title}_${movie.id}',
                            ),
                            Positioned(
                              bottom: -15,
                              left: -30,
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 80,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )
                        : MovieCard(
                          movieId: movie.id,
                          posterPath: movie.posterPath ?? '',
                          heroTag: '${title}_${movie.id}',
                        ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 5);
            },
          ),
        ),
      ],
    );
  }
}
