class Movie {
  /// 영화의 고유 ID (API에서 유니크한 식별자)
  final int id;

  /// 영화의 제목
  final String title;

  /// 영화의 원제목
  final String originalTitle;

  /// 영화의 포스터 이미지 경로
  final String? posterPath;

  /// 영화의 배경 이미지 경로
  final String? backdropPath;

  /// 영화의 장르 ID 리스트
  final List<int> genreIds;

  /// 영화에 대한 간략한 설명 (줄거리)
  final String overview;

  /// 영화의 인기 점수
  final double popularity;

  /// 영화의 개봉일
  final String releaseDate;

  /// 영화의 평균 평점
  final double voteAverage;

  /// 영화에 대한 총 투표 수
  final int voteCount;

  final String? tagline;
  final int? runtime;
  final List<String>? genres;
  final int? budget;
  final int? revenue;

  Movie({
    required this.id,
    required this.title,
    required this.originalTitle,
    this.posterPath,
    this.backdropPath,
    required this.genreIds,
    required this.overview,
    required this.popularity,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    this.tagline,
    this.runtime,
    this.genres,
    this.budget,
    this.revenue,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int,
      title: json['title'] as String,
      originalTitle: json['original_title'] as String,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      genreIds:
          json['genre_ids'] != null
              ? (json['genre_ids'] as List<dynamic>)
                  .map((e) => e as int)
                  .toList()
              : [],
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      releaseDate: json['release_date'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
      tagline: json['tagline'] as String?,
      runtime: json['runtime'] as int?,
      genres:
          json['genres'] != null
              ? (json['genres'] as List<dynamic>)
                  .map((e) => e['name'] as String)
                  .toList()
              : null,
      budget: json['budget'] as int?,
      revenue: json['revenue'] as int?,
    );
  }
}
