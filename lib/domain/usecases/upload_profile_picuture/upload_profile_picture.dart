import 'package:flutter_flix_id/domain/entities/result.dart';
import 'package:flutter_flix_id/domain/usecases/upload_profile_picuture/upload_profile_picuture_param.dart';
import 'package:flutter_flix_id/domain/usecases/usecase.dart';
import 'package:flutter_flix_id/data/repositories/user_repository.dart';
import 'package:flutter_flix_id/domain/entities/user.dart';

class UploadProfilePicture
    implements Usecase<Result<User>, UploadProfilePictureParam> {
  final UserRepository _userRepository;

  UploadProfilePicture({required UserRepository userRepository})
    : _userRepository = userRepository;

  @override
  Future<Result<User>> call(UploadProfilePictureParam params) => _userRepository
      .uploadProfilePicture(imageFile: params.imageFile, user: params.user);
}
