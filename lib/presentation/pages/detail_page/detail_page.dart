import 'package:flutter/material.dart';
import 'package:flutter_flix_id/domain/entities/movie.dart';
import 'package:flutter_flix_id/presentation/misc/constants.dart';
import 'package:flutter_flix_id/presentation/misc/methods.dart';
import 'package:flutter_flix_id/presentation/pages/detail_page/methods/background.dart';
import 'package:flutter_flix_id/presentation/providers/movie/movie_detail_provider.dart';
import 'package:flutter_flix_id/presentation/providers/router/router_provider.dart';
import 'package:flutter_flix_id/presentation/widgets/back_navigation_bar.dart';
import 'package:flutter_flix_id/presentation/widgets/network_image_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  final Movie movie;
  const DetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var asyncMovieDetail = ref.watch(MovieDetailProvider(movie: movie));

    return Scaffold(
      body: Stack(
        children: [
          ...background(movie),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackNavigationBar(
                      title: movie.title,
                      onTap: () => ref.read(routerProvider).pop(),
                    ),
                    verticalSpaces(24),
                    NetworkImageCard(
                      width: MediaQuery.of(context).size.width,
                      height: (MediaQuery.of(context).size.width),
                      borderRadius: 15,
                      imageUrl: () {
                        final detail = asyncMovieDetail.valueOrNull;
                        final path = detail?.backdropPath ?? movie.posterPath;
                        final fullUrl =
                            path != null
                                ? 'https://image.tmdb.org/t/p/w500$path'
                                : null;

                                return fullUrl;
                      }(),
                      fit: BoxFit.cover,
                    ),

                    verticalSpaces(24),
                    // ...movieShortInfo(),
                    verticalSpaces(20),
                    // movieOverview(),
                    verticalSpaces(40),
                  ],
                ),
              ),
              // ...castAndCrew(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 24,
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: backgroundColor,
                    backgroundColor: saffron,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Book Ticket Now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
