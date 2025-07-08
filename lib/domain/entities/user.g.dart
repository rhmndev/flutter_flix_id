// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  uid: json['uid'] as String,
  email: json['email'] as String,
  name: json['name'] as String,
  photoUrl: json['photoUrl'] as String?,
  balance: json['balance'] == null ? 0 : _balanceFromJson(json['balance']),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'uid': instance.uid,
  'email': instance.email,
  'name': instance.name,
  'photoUrl': instance.photoUrl,
  'balance': instance.balance,
};
