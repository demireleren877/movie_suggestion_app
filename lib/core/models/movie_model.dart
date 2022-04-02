import 'package:hive_flutter/adapters.dart';
import 'package:movie_application/core/constants/hive_constants.dart';
part 'movie_model.g.dart';

@HiveType(typeId: HiveConstants.movieType)
class Movie {
  @HiveField(0)
  final String backdropPath;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final List<int> genreIds;
  @HiveField(3)
  final String originalLanguage;
  @HiveField(4)
  final String originalTitle;
  @HiveField(5)
  final String overview;
  @HiveField(6)
  final String posterPath;
  @HiveField(7)
  final String releaseDate;
  @HiveField(8)
  final String title;
  @HiveField(9)
  final bool video;
  @HiveField(10)
  final int voteCount;
  @HiveField(11)
  final String voteAverage;
  @HiveField(12)
  final int runtime;

  Movie({
    required this.runtime,
    required this.genreIds,
    required this.backdropPath,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteCount,
    required this.voteAverage,
  });

  factory Movie.fromJson(dynamic json) {
    return Movie(
        runtime: json['runtime'] ?? 000,
        genreIds: List<int>.from(json['genre_ids']),
        backdropPath: json['backdrop_path'] ?? "",
        id: json['id'] ?? 0,
        originalLanguage: json['original_language'] ?? "en",
        originalTitle: json['original_title'] ?? "",
        overview: json['overview'] ?? "",
        posterPath: json['poster_path'] ?? "",
        releaseDate: json['release_date'] ?? "",
        title: json['title'] ?? "",
        video: json['video'] ?? false,
        voteCount: json['vote_count'] ?? 0,
        voteAverage: json['vote_average'].toString());
  }
}
