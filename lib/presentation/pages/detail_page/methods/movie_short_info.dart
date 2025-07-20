import 'package:flutter/material.dart';
import 'package:flutter_flix_id/domain/entities/movie_detail.dart';
import 'package:flutter_flix_id/presentation/misc/methods.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> movieShortInfo({
  required AsyncValue<MovieDetail?> asyncMovieDetail,
  required BuildContext context,
}) => [
  Row(
    children: [
      SizedBox(
        width: 14,
        height: 14,
        child: Image.asset('assets/duration.png'),
      ),
      horizontalSpaces(5),
      SizedBox(
        width: 95,
        child: Builder(
          builder: (_) {
            return asyncMovieDetail.when(
              data: (movieDetail) {
                // print('=== DEBUG: MovieDetail in Widget ===');
                // print(movieDetail);
                // print('Runtime in widget: ${movieDetail?.runtime}');
                return Text(
                  movieDetail != null ? '${movieDetail.runtime} minutes' : '-',
                  style: const TextStyle(fontSize: 12),
                );
              },
              error: (error, stackTrace) {
                // print('ERROR: $error');
                return const Text('-', style: TextStyle(fontSize: 12));
              },
              loading: () {
                return const Text('-', style: TextStyle(fontSize: 12));
              },
            );
          },
        ),
      ),
      SizedBox(width: 14, height: 14, child: Image.asset('assets/genre.png')),
      horizontalSpaces(5),
      SizedBox(
        width: MediaQuery.of(context).size.width - 48 - 95 - 14 - 14 - 5 - 5,
        child: asyncMovieDetail.when(
          data: (movieDetail) {
            String genres = movieDetail?.genres.join(', ') ?? '-';

            return Text(
              genres,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            );
          },
          error:
              (error, stackTrace) =>
                  const Text('-', style: TextStyle(fontSize: 12)),
          loading: () => const Text('-', style: TextStyle(fontSize: 12)),
        ),
      ),
    ],
  ),
  verticalSpaces(10),
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(width: 14, height: 14, child: Image.asset('assets/star.png')),
      horizontalSpaces(5),
      SizedBox(
        child: Text((asyncMovieDetail.valueOrNull?.voteAverage ?? 0).toStringAsFixed(1)),
      ),
    ],
  ),
];
