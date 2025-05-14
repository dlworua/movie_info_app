class Movie {
  final String title;
  final String releaseDate;
  final String tagline;
  final int runtime;
  final String overview;
  final String posterPath;
  final List<String> genres;
  final double voteAverage;
  final Map<String, dynamic> boxOffice;

  const Movie({
    required this.title,
    required this.releaseDate,
    required this.tagline,
    required this.runtime,
    required this.overview,
    required this.posterPath,
    required this.genres,
    required this.voteAverage,
    required this.boxOffice,
  });
}
