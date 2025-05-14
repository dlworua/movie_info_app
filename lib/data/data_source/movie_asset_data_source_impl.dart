import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_info_app/data/data_source/movie_data_source.dart';
import 'package:movie_info_app/data/dto/Movie_Detail_Dto.dart';
import 'package:movie_info_app/data/dto/Movie_Response_Dto.dart';

class MovieAssetDataSourceImpl implements MovieDataSource {
  MovieAssetDataSourceImpl(this._assetBundle);
  final AssetBundle _assetBundle;

  @override
  Future<List<MovieResponsDto>> fetchMovies() async {
    final jsonString = await rootBundle.loadString('assets/movie.json');
    final list = jsonDecode(jsonString); // 전체 맵
    final results = jsonMap['results'] as List; // 'results'만 추출
    return results.map((e) => MovieResponseDto.fromJson(e)).toList();
  }
}
