//  현재 상영중, 인기순, 평점 높은순, 개봉예정

// {
//   "adult": false,
//   "backdrop_path": "/cJvUJEEQ86LSjl4gFLkYpdCJC96.jpg",
//   "genre_ids": [
//     10752,
//     28
//   ],
//   "id": 1241436,
//   "original_language": "en",
//   "original_title": "Warfare",
//   "overview": "A platoon of Navy SEALs embarks on a dangerous mission in Ramadi, Iraq, with the chaos and brotherhood of war retold through their memories of the event.",
//   "popularity": 485.3223,
//   "poster_path": "/j8tqBXwH2PxBPzbtO19BTF9Ukbf.jpg",
//   "release_date": "2025-04-09",
//   "title": "Warfare",
//   "video": false,
//   "vote_average": 7.133,
//   "vote_count": 252
// }

class MovieResponseDto {
  final int id;
  final String title;
  final String releaseDate;
  final String overview;
  final String posterPath;
  final double voteAverage;
  final List<int> genreIds;

  MovieResponseDto({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.genreIds,
  });

  factory MovieResponseDto.fromJson(Map<String, dynamic> json) {
    return MovieResponseDto(
      id: json['id'],
      title: json['title'] ?? '',
      releaseDate: json['release_date'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      genreIds: List<int>.from(json['genre_ids'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'release_date': releaseDate,
      'overview': overview,
      'poster_path': posterPath,
      'vote_average': voteAverage,
      'genre_ids': genreIds,
    };
  }
}
