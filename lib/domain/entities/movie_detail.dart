import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_detail.freezed.dart';

@freezed
abstract class MovieDetail with _$MovieDetail {
  const factory MovieDetail({
    required String id,
    required String title,
    String? posterPath,
    required String overview,
    String? backdropPath,
    required int runtime,
    required double voteAverage,
    required List<String> genres,
  }) = _MovieDetail;

  factory MovieDetail.fromJSON(Map<String, dynamic> json) {
    // Debug logs
    print('=== DEBUG: Incoming JSON MovieDetail ===');
    print(json); // log semua json
    print('Runtime from JSON: ${json['runtime']}');
    print('backdropPath from JSON: ${json['backdrop_path']}');

    return MovieDetail(
      id: json['id'].toString(),
      title: json['title'] ?? '-',
      overview: json['overview'] ?? '-',
      runtime: json['runtime'] ?? 0,
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      genres: List<String>.from((json['genres'] ?? []).map((e) => e['name'])),
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
    );
  }
}
