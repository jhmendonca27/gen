import 'package:gen_app/pages/home/domain/entities/mcu_entite.dart';

class McuModel extends McuEntite{

  const McuModel({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount
}):super(
      adult: adult,
      backdropPath: backdropPath,
      genreIds: genreIds,
      id: id,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      releaseDate: releaseDate,
      title: title,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
  );

  factory McuModel.fromJson(Map<String, dynamic> json) => McuModel(
  adult: json['adult'],
  backdropPath: json['backdrop_path'],
  genreIds: json['genre_ids'].cast<int>(),
  id: json['id'],
  originalLanguage: json['original_language'],
  originalTitle: json['original_title'],
  overview: json['overview'],
  popularity: json['popularity'],
  posterPath: json['poster_path'],
  releaseDate: json['release_date'],
  title: json['title'],
  video: json['video'],
  voteAverage: json['vote_average'],
  voteCount: json['vote_count'],
  );

}