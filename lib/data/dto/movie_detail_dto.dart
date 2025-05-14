class MovieDetailDto {
  final bool adult;
  final String? backdropPath;
  final BelongsToCollectionDto? belongsToCollection;
  final int budget;
  final List<GenreDto> genres;
  final String? homepage;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final List<ProductionCompanyDto> productionCompanies;
  final List<ProductionCountryDto> productionCountries;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguageDto> spokenLanguages;
  final String status;
  final String? tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieDetailDto({
    required this.adult,
    this.backdropPath,
    this.belongsToCollection,
    required this.budget,
    required this.genres,
    this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDetailDto.fromJson(Map<String, dynamic> json) {
    return MovieDetailDto(
      adult: json['adult'] as bool,
      backdropPath: json['backdrop_path'] as String?,
      belongsToCollection:
          json['belongs_to_collection'] != null
              ? BelongsToCollectionDto.fromJson(json['belongs_to_collection'])
              : null,
      budget: json['budget'] as int,
      genres:
          (json['genres'] as List)
              .map((genre) => GenreDto.fromJson(genre))
              .toList(),
      homepage: json['homepage'] as String?,
      id: json['id'] as int,
      imdbId: json['imdb_id'] as String,
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String?,
      productionCompanies:
          (json['production_companies'] as List)
              .map((company) => ProductionCompanyDto.fromJson(company))
              .toList(),
      productionCountries:
          (json['production_countries'] as List)
              .map((country) => ProductionCountryDto.fromJson(country))
              .toList(),
      releaseDate: json['release_date'] as String,
      revenue: json['revenue'] as int,
      runtime: json['runtime'] as int,
      spokenLanguages:
          (json['spoken_languages'] as List)
              .map((language) => SpokenLanguageDto.fromJson(language))
              .toList(),
      status: json['status'] as String,
      tagline: json['tagline'] as String?,
      title: json['title'] as String,
      video: json['video'] as bool,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
    );
  }
}

class BelongsToCollectionDto {
  final int id;
  final String name;
  final String? posterPath;
  final String? backdropPath;

  BelongsToCollectionDto({
    required this.id,
    required this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory BelongsToCollectionDto.fromJson(Map<String, dynamic> json) {
    return BelongsToCollectionDto(
      id: json['id'] as int,
      name: json['name'] as String,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
    );
  }
}

class GenreDto {
  final int id;
  final String name;

  GenreDto({required this.id, required this.name});

  factory GenreDto.fromJson(Map<String, dynamic> json) {
    return GenreDto(id: json['id'] as int, name: json['name'] as String);
  }
}

class ProductionCompanyDto {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  ProductionCompanyDto({
    required this.id,
    this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompanyDto.fromJson(Map<String, dynamic> json) {
    return ProductionCompanyDto(
      id: json['id'] as int,
      logoPath: json['logo_path'] as String?,
      name: json['name'] as String,
      originCountry: json['origin_country'] as String,
    );
  }
}

class ProductionCountryDto {
  final String iso31661;
  final String name;

  ProductionCountryDto({required this.iso31661, required this.name});

  factory ProductionCountryDto.fromJson(Map<String, dynamic> json) {
    return ProductionCountryDto(
      iso31661: json['iso_3166_1'] as String,
      name: json['name'] as String,
    );
  }
}

class SpokenLanguageDto {
  final String englishName;
  final String iso6391;
  final String name;

  SpokenLanguageDto({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguageDto.fromJson(Map<String, dynamic> json) {
    return SpokenLanguageDto(
      englishName: json['english_name'] as String,
      iso6391: json['iso_639_1'] as String,
      name: json['name'] as String,
    );
  }
}
