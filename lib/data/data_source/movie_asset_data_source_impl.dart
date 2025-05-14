import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_info_app/data/data_source/movie_data_source.dart';
import 'package:movie_info_app/data/dto/Movie_Detail_Dto.dart';
import 'package:movie_info_app/data/dto/Movie_Response_Dto.dart';

class MovieAssetDataSourceImpl implements MovieDataSource {
  MovieAssetDataSourceImpl(this._assetBundle);
  final AssetBundle _assetBundle;

  @override
  Future<List<MovieResponseDto>> fetchMovies() async {
    // JSON 파일을 문자열로 로드
    final jsonString = await _assetBundle.loadString('assets/movie.json');
    // JSON을 List로 디코딩
    final List<dynamic> jsonList = jsonDecode(jsonString);
    // List<dynamic>을 MovieResponseDto 리스트로 변환
    return jsonList.map((e) => MovieResponseDto.fromJson(e)).toList();
  }
}
