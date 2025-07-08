import 'package:flutter_flix_id/domain/entities/actor.dart';
import 'package:flutter_flix_id/domain/entities/movie.dart';
import 'package:flutter_flix_id/domain/entities/movie_detail.dart';
import 'package:flutter_flix_id/domain/entities/result.dart';

abstract interface class MovieRepository {
  Future<Result<List<Movie>>> getNowPlaying({int page = 1});
  Future<Result<List<Movie>>> getUpcoming({ int page = 1});
  Future<Result<MovieDetail>> getDetail({required String id});
  Future<Result<List<Actor>>> getActors({required String id});
}