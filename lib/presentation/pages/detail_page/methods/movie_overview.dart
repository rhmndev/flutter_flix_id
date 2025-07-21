import 'package:flutter/material.dart';
import 'package:flutter_flix_id/domain/entities/movie_detail.dart';
import 'package:flutter_flix_id/presentation/misc/methods.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieOverviewSection extends StatefulWidget {
  final AsyncValue<MovieDetail?> asyncMovieDetail;

  const MovieOverviewSection({super.key, required this.asyncMovieDetail});

  @override
  State<MovieOverviewSection> createState() => _MovieOverviewSectionState();
}

class _MovieOverviewSectionState extends State<MovieOverviewSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Overview',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        verticalSpaces(10),
        widget.asyncMovieDetail.when(
          data: (movieDetail) {
            final overview = movieDetail?.overview ?? '';
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  overview,
                  maxLines: _isExpanded ? null : 4,
                  overflow: _isExpanded
                      ? TextOverflow.visible
                      : TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14),
                ),
                if (overview.length > 100) ...[
                  verticalSpaces(5),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: Text(
                      _isExpanded ? 'Show less' : 'See for more',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFFF4C95D),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            );
          },
          error: (error, stackTrace) => const Text(
            'Failed to load movie overview. Please try again later.',
          ),
          loading: () => Center(child: const CircularProgressIndicator()),
        ),
      ],
    );
  }
}