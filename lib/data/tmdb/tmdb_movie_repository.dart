import 'package:dio/dio.dart';
import 'package:flutter_flix_id/data/repositories/movie_repository.dart';
import 'package:flutter_flix_id/domain/entities/actor.dart';
import 'package:flutter_flix_id/domain/entities/movie.dart';
import 'package:flutter_flix_id/domain/entities/movie_detail.dart';
import 'package:flutter_flix_id/domain/entities/result.dart';

class TmdbMovieRepository implements MovieRepository {
  final Dio? _dio;
  final String _accessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZmViNWRlZGU3YjMyNDBkZGRjOThlMDg3ODgwY2E5MiIsIm5iZiI6MTcxNTAyMDY1Mi43ODQ5OTk4LCJzdWIiOiI2NjM5MjM2YzVlZDhlOTAxMjMxNTdhNzIiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.n2ZXA4WeNIgQE2TaQYnpBp2SZhkKEmYbjCKQUgWDk_w';

  late final Options _options = Options(
    headers: {'Authorization': 'Bearer $_accessToken',
      'accept' : 'application/json',
    });

  TmdbMovieRepository({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Result<List<Actor>>> getActors({required String id}) async {
    try {
      final response = await _dio!.get(
        'https://api.themoviedb.org/3/movie/$id/credits?language=en-US',
        options: _options);

        final results = List<Map<String, dynamic>>.from(response.data['cast']);
        return Result.success(results.map((e) => Actor.fromJSON(e)).toList());
        
        // bisa juga seperti yang dibawah ini
      // return Result.success(response.data['cast'].map<Actor>((e) => Actor.fromJSON(e)).toList());
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  @override
  Future<Result<MovieDetail>> getDetail({required String id}) async {
    try {
      final response = await _dio!.get(
        'https://api.themoviedb.org/3/movie/$id?language=en-US',
        options: _options);

        return Result.success(MovieDetail.fromJSON(response.data));
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlaying({int page = 1}) => 
      _getMovies(_MovieCategory.nowPlaying.toString(), page: page);

  @override
  Future<Result<List<Movie>>> getUpcoming({int page = 1}) => 
      _getMovies(_MovieCategory.upcoming.toString(), page: page);

  Future<Result<List<Movie>>> _getMovies(String category, {int page = 1}) async {
    try {
      final response = await _dio!.get(
        'https://api.themoviedb.org/3/movie/$category?language=en-US&page=$page',
        options: _options,
      );

      final results = List<Map<String, dynamic>>.from(response.data['results']);

      return Result.success(results.map((e) => Movie.fromJSON(e)).toList());
    } on DioException catch (e) {
    return Result.failed('${e.message}');
    
    }
  }

}

enum _MovieCategory {
  nowPlaying('now_playing'),
  upcoming('upcoming');

  final String _instring;

  const _MovieCategory(String inString) : _instring = inString;

@override
String toString() => _instring;

}