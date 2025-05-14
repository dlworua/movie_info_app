import 'package:flutter/material.dart';
import '../detail/detail_screen.dart';

class MovieCard extends StatelessWidget {
  final int movieId;
  final String posterPath;
  final String heroTag;
  final double width;
  final double height;
  final EdgeInsets? padding;

  const MovieCard({
    super.key,
    required this.movieId,
    required this.posterPath,
    required this.heroTag,
    this.width = 120,
    this.height = 180,
    this.padding,
  });

  String _getImageUrl(String path) {
    if (path.isEmpty) {
      return 'https://via.placeholder.com/500x750?text=No+Image';
    }
    return 'https://image.tmdb.org/t/p/w500$path';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        DetailScreen(movieId: movieId, heroTag: heroTag),
              ),
            ),
        child: Hero(
          tag: heroTag,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              _getImageUrl(posterPath),
              width: width,
              height: height,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: width,
                  height: height,
                  color: Colors.grey[900],
                  child: const Center(
                    child: Icon(Icons.movie, size: 30, color: Colors.white54),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
