class Movie {
  final String backdropPath;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final int voteCount;
  final String voteAverage;

  Movie({
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
