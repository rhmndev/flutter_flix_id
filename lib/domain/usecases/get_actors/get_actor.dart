import 'package:flutter_flix_id/data/repositories/movie_repository.dart';
import 'package:flutter_flix_id/domain/entities/actor.dart';
import 'package:flutter_flix_id/domain/entities/result.dart';
import 'package:flutter_flix_id/domain/usecases/get_actors/get_actors_param.dart';
import 'package:flutter_flix_id/domain/usecases/usecase.dart';

class GetActors implements Usecase<Result<List<Actor>>, GetActorsParam> {
  final MovieRepository _movieRepository;

  GetActors({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  @override
  Future<Result<List<Actor>>> call(GetActorsParam params) async {
    var actorListResult = await _movieRepository.getActors(id: params.movieId.toString());

    return switch (actorListResult) {
      Success(value: final actorList) => Result.success(actorList),
      Failed(:final message) => Result.failed(message)
    };
  }
}
