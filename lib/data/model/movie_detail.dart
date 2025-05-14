class MovieDetail {
  final int id;
  final String title;
  final String overview;
  final String? tagline;
  final String releaseDate;
  final int runtime;
  final double popularity;
  final int budget;
  final int voteCount;
  final double voteAverage;
  final List<Genre> genres;
  final List<String> images;

  MovieDetail({
    required this.id,
    required this.title,
    required this.overview,
    this.tagline,
    required this.releaseDate,
    required this.runtime,
    required this.popularity,
    required this.budget,
    required this.voteCount,
    required this.voteAverage,
    required this.genres,
    required this.images,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      id: json['id'] as int,
      title: json['title'] as String,
      overview: json['overview'] as String,
      tagline: json['tagline'] as String?,
      releaseDate: json['release_date'] as String,
      runtime: json['runtime'] as int,
      popularity: (json['popularity'] as num).toDouble(),
      budget: json['budget'] as int,
      voteCount: json['vote_count'] as int,
      voteAverage: (json['vote_average'] as num).toDouble(),
      genres:
          (json['genres'] as List)
              .map((genre) => Genre.fromJson(genre as Map<String, dynamic>))
              .toList(),
      images:
          (json['images']['backdrops'] as List)
              .map((image) => image['file_path'] as String)
              .toList(),
    );
  }
}

class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(id: json['id'] as int, name: json['name'] as String);
  }
}
