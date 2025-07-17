import 'package:flutter/material.dart';
import 'package:flutter_flix_id/presentation/misc/methods.dart';
import 'package:flutter_flix_id/presentation/pages/movie_page/methods/movie_list.dart';
import 'package:flutter_flix_id/presentation/pages/movie_page/methods/promotion_list.dart';
import 'package:flutter_flix_id/presentation/pages/movie_page/methods/search_bar.dart';
import 'package:flutter_flix_id/presentation/pages/movie_page/methods/user_info.dart';
import 'package:flutter_flix_id/presentation/providers/movie/now_playing_provider.dart';
import 'package:flutter_flix_id/presentation/providers/movie/upcoming_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviePage extends ConsumerWidget {
  final List<String> promotionImageFileNames = const [
    'popcorn.jpg',
    'buy1get1.jpg',
  ];

  const MoviePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userInfo(ref),
            verticalSpaces(40),
            searchBar(context),
            verticalSpaces(24),
            ...movieList(
              title: 'Now Playing',
              movies: ref.watch(nowPlayingProvider),
              onTap:
                  (movie) => {
                    // Pindah ke halaman detail page movie
                  },
            ),
            verticalSpaces(30),
            ...promotionList(promotionImageFileNames),
            verticalSpaces(30),
            ...movieList(
              title: 'Upcoming',
              movies: ref.watch(upComingProvider),
            ),
            verticalSpaces(100),
          ],
        ),
      ],
    );
  }
}
