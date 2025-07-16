import 'package:flutter/material.dart';
import 'package:flutter_flix_id/presentation/misc/methods.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> userInfo(WidgetRef ref) => [
  Container(
    width: 110,
    height: 110,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: Colors.grey, width: 1),
      image: DecorationImage(
        image:
            ref.watch(userDataProvider).valueOrNull?.photoUrl != null
                ? NetworkImage(
                      ref.watch(userDataProvider).valueOrNull!.photoUrl!,
                    )
                    as ImageProvider
                : const AssetImage('assets/pp-placeholder.png'),
        fit: BoxFit.cover,
      ),
    ),
  ),
  verticalSpaces(20),
  Text(
    ref.watch(userDataProvider).valueOrNull?.name ?? '',
    textAlign: TextAlign.center,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
  ),
  Text(
    ref.watch(userDataProvider).valueOrNull?.email ?? '',
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 12),
  ),
];
