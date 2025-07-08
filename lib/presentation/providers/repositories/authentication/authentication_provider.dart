// import 'package:flutter_flix_id/data/dummies/dummy_authentication.dart';
import 'package:flutter_flix_id/data/firebase/firebase_authentication.dart';
import 'package:flutter_flix_id/data/repositories/authentication.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

@riverpod
Authentication authentication(AuthenticationRef ref) => FirebaseAuthentication();