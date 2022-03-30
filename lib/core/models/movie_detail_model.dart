import 'cast_list_model.dart';
import 'movie_images_model.dart';

class MovieDetail {
  final String id;
  final String title;
  final List genres;
  final String posterPath;
  final String budget;
  final String originalTitle;
  final String overview;
  final String releaseDate;
  final String runtime;
  final String voteAverage;
  final String voteCount;
  final String videoId;

  MovieImage? movieImage;

  List<Cast>? castList;

  MovieDetail({
    this.castList,
    this.movieImage,
    required this.videoId,
    required this.genres,
    required this.posterPath,
    required this.id,
    required this.title,
    required this.budget,
    required this.originalTitle,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDetail.fromJson(dynamic json) {
    return MovieDetail(
        genres: json['genres'],
        posterPath: json['poster_path'],
        id: json['id'].toString(),
        title: json['title'],
        budget: json['budget'].toString(),
        originalTitle: json['original_title'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        runtime: json['runtime'].toString(),
        voteAverage: json['vote_average'].toString(),
        voteCount: json['vote_count'].toString(),
        videoId: json["videos"]["results"].isNotEmpty
            ? json['videos']['results'].last["key"]
            : "");
  }
}
