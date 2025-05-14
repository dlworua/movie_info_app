// 상세정보

// {
//   "adult": false,
//   "backdrop_path": "/cJvUJEEQ86LSjl4gFLkYpdCJC96.jpg",
//   "belongs_to_collection": null,
//   "budget": 20000000,
//   "genres": [
//     {
//       "id": 10752,
//       "name": "War"
//     },
//     {
//       "id": 28,
//       "name": "Action"
//     }
//   ],
//   "homepage": "https://a24films.com/films/warfare",
//   "id": 1241436,
//   "imdb_id": "tt31434639",
//   "origin_country": [
//     "US"
//   ],
//   "original_language": "en",
//   "original_title": "Warfare",
//   "overview": "A platoon of Navy SEALs embarks on a dangerous mission in Ramadi, Iraq, with the chaos and brotherhood of war retold through their memories of the event.",
//   "popularity": 538.9681,
//   "poster_path": "/j8tqBXwH2PxBPzbtO19BTF9Ukbf.jpg",
//   "production_companies": [
//     {
//       "id": 284,
//       "logo_path": "/6a26if3IKy7mlrQuGHHVp6ufQtF.png",
//       "name": "DNA Films",
//       "origin_country": "GB"
//     },
//     {
//       "id": 41077,
//       "logo_path": "/1ZXsGaFPgrgS6ZZGS37AqD5uU12.png",
//       "name": "A24",
//       "origin_country": "US"
//     }
//   ],
//   "production_countries": [
//     {
//       "iso_3166_1": "GB",
//       "name": "United Kingdom"
//     },
//     {
//       "iso_3166_1": "US",
//       "name": "United States of America"
//     }
//   ],
//   "release_date": "2025-04-09",
//   "revenue": 29865776,
//   "runtime": 95,
//   "spoken_languages": [
//     {
//       "english_name": "English",
//       "iso_639_1": "en",
//       "name": "English"
//     },
//     {
//       "english_name": "Turkish",
//       "iso_639_1": "tr",
//       "name": "Türkçe"
//     }
//   ],
//   "status": "Released",
//   "tagline": "Everything is based on memory.",
//   "title": "Warfare",
//   "video": false,
//   "vote_average": 7.135,
//   "vote_count": 233
// }

class Movie {
  final String title;
  final String releaseDate;
  final String tagline;
  final String runtime;
  final String overview;
  final String posterPath;
  final List<Map> genres;
  final double voteAverage;
  final int boxOffice;

  // genres는 List<Map>, voteAverage는 double, boxOffice는 int 식으로 다뤄야 안정적인 앱이 됨
  // 이유_ Dart는 정적 타입 언어이므로 자료형이 명확해야 함, 그래서 fromJson, toJson에서 자료형을 일관되게 다루는 게 매우 중요

  Movie({
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

  // fromJson 생성자(JSON → Movie 객체로 변환)
  factory Movie.fromJson(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] ?? '', //null이면 빈 문자열로 대체 (??'')로 안전하게 처리
      releaseDate: map['release_date'] ?? '',
      tagline: map['tagline'] ?? '',
      runtime: map['runtime'] ?? 0,
      overview: map['overview'] ?? '',
      posterPath: map['poster_path'] ?? '',

      // JSON에서는 List<Map<String, dynamic>> 형태로 오므로
      //List<Map>.from(...) 으로 변환 List<dynamic> 을 List<Map>으로 안전하게 바꿈
      genres: List<Map<String, dynamic>>.from(map['genres'] ?? []),
      voteAverage: (map['vote_average'] ?? 0).toDouble(),
      boxOffice: map['revenue'] ?? 0,
    );
  }

  // toJson 메서드(Movie 객체 → JSON으로 변환)
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'release_date': releaseDate,
      'tagline': tagline,
      //우리가 저장한 값이 "95분"이므로 JSON에서는 95로 돌려줘야 하기에 '분'을 제거
      'runtime': runtime,
      'overview': overview,
      'poster_path': posterPath,
      'genres': genres,
      'vote_average': voteAverage,
      'revenue': boxOffice,
    };
  }
}

