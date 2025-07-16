import 'package:flutter/material.dart';
import 'package:flutter_flix_id/presentation/extensions/int_extension.dart';
import 'package:flutter_flix_id/presentation/misc/methods.dart';
import 'package:flutter_flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget userInfo(WidgetRef ref) => Padding(
  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
  child: Row(
    children: [
      Container(
        height: 64,
        width: 64,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          shape: BoxShape.circle,
          image: DecorationImage(
            image:
                ref.watch(userDataProvider).valueOrNull!.photoUrl != null
                    ? NetworkImage(
                          ref.watch(userDataProvider).valueOrNull!.photoUrl!,
                        )
                        as ImageProvider
                    : const AssetImage('assets/pp-placeholder.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      horizontalSpaces(16),
      GestureDetector(
        onTap: () {
          // go to wallet_page
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${getGreeting()}, ${ref.watch(userDataProvider).when(data: (user) => user?.name.split(' ').first ?? '', error: (error, stackTrace) => '', loading: () => 'Loading....')}!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              "Let's book your favorite movies",
              style: TextStyle(fontSize: 12),
            ),
            verticalSpaces(5),
            Row(
              children: [
                SizedBox(
                  width: 18,
                  height: 18,
                  child: Image.asset('assets/wallet.png'),
                ),
                horizontalSpaces(10),
                Text(
                  ref
                      .watch(userDataProvider)
                      .when(
                        data:
                            (user) =>
                                (user?.balance ?? 0).toIDRCurrencyFormat(),
                        error: (error, stackTrace) => 'IDR 0',
                        loading: () => 'Loading....',
                      ),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  ),
);

String getGreeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning';
  } else if (hour < 18) {
    return 'Good Afternoon';
  } else {
    return 'Good Evening';
  }
}
