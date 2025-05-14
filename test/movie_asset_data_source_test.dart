import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_info_app/data/data_source/movie_asset_data_source_impl.dart';
import 'package:movie_info_app/data/dto/Movie_Detail_Dto.dart';

class MovieAssetBundle extends Mock implements AssetBundle {}

void main() {
  //
  MovieAssetBundle? mockAssetbundle;
  MovieAssetDataSourceImpl? dataSource;

  setUp(() {
    //
    mockAssetbundle = MovieAssetBundle();
    dataSource = MovieAssetDataSourceImpl(mockAssetbundle!);
  });

  test('MovieAssetDataSourceImpl : fetchMovies return data test ', () async {
    //어떠한 값이 오더라도 any 넣기
    when(() {
      // 어떠한 상황이 발생했을때
      return mockAssetbundle!.loadString(any());
    }).thenAnswer(
      // 이렇게 리턴해주라고 설정
      (_) async => """ 
    [{  "adult": false,
    "backdrop_path": "/cJvUJEEQ86LSjl4gFLkYpdCJC96.jpg",
    "belongs_to_collection": null,
    "budget": 20000000,
    "genres": [
      {
        "id": 10752,
        "name": "War" 
      },
      { 
        "id": 28,
        "name": "Action"
      }
    ],
    "homepage": "https://a24films.com/films/warfare",
    "id": 1241436,
    "imdb_id": "tt31434639",
    "origin_country": [
      "US"
    ],
    "original_language": "en",
    "original_title": "Warfare",
    "overview": "A platoon of Navy SEALs embarks on a dangerous mission in Ramadi, Iraq, with the chaos and brotherhood of war retold through their memories of the event.",
    "popularity": 538.9681,
    "poster_path": "/j8tqBXwH2PxBPzbtO19BTF9Ukbf.jpg",
    "production_companies": [
      {
        "id": 284,
        "logo_path": "/6a26if3IKy7mlrQuGHHVp6ufQtF.png",
        "name": "DNA Films",
        "origin_country": "GB"
      },
      {
        "id": 41077,
        "logo_path": "/1ZXsGaFPgrgS6ZZGS37AqD5uU12.png",
        "name": "A24",
        "origin_country": "US"
      }
    ],
    "production_countries": [
      {
        "iso_3166_1": "GB",
        "name": "United Kingdom"
      },
      {
        "iso_3166_1": "US",
        "name": "United States of America"
      }
    ],
    "release_date": "2025-04-09",
    "revenue": 29865776,
    "runtime": 95,
    "spoken_languages": [
      {
        "english_name": "English",
        "iso_639_1": "en",
        "name": "English"
      },
      {
        "english_name": "Turkish",
        "iso_639_1": "tr",
        "name": "Türkçe"
      }
    ],
    "status": "Released",
    "tagline": "Everything is based on memory.",
    "title": "Warfare",
    "video": false,
    "vote_average": 7.135,
    "vote_count": 233
  }]
      """,
    );

    final results = await dataSource!.fetchMovies();
    expect(results.length, 1);
  });
}
