import 'package:freezed_annotation/freezed_annotation.dart';

part 'actor.freezed.dart';

@freezed
abstract class Actor with _$Actor {
  const factory Actor({required String name, String? profilePath}) = _Actor;

  factory Actor.fromJSON(Map<String, dynamic> json) =>
      Actor(name: json['name'], profilePath: json['profile_path']);
}
