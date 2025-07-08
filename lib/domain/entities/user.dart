import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

int _balanceFromJson(dynamic value) {
  if (value is int) return value;
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}

@freezed
abstract class User with _$User {
  const factory User({
    required String uid,
    required String email,
    required String name,
    String? photoUrl,
    @JsonKey(fromJson: _balanceFromJson) @Default(0) int balance,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
