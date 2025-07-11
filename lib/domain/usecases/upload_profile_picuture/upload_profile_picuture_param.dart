import 'dart:io';

import 'package:flutter_flix_id/domain/entities/user.dart';



class UploadProfilePictureParam {
  final File imageFile;
  final User user;

  UploadProfilePictureParam({required this.imageFile, required this.user});
}
