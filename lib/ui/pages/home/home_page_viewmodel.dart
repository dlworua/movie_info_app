import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/data/data_source/movie_asset_data_source_impl.dart';
import 'package:movie_info_app/data/data_source/movie_data_source.dart';
import 'package:movie_info_app/data/domain/entity/movie_details.dart';
import 'package:movie_info_app/data/dto/movie_detail_dto.dart';
import 'package:movie_info_app/data/repository/movie_repository_impl.dart';

class HomePageViewmodel extends Notifier<List<Movie>> {
  @override
  List<Movie> build() {
    getMovies();
    return [];
  }

  void getMovies() async {
    state =
        await MovieRepositoryImpl(
          MovieAssetDataSourceImpl(DefaultAssetBundle.of(context)),
        ).fetchMovies();
  }
}
