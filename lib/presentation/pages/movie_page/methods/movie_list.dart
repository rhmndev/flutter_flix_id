import 'package:flutter/material.dart';
import 'package:flutter_flix_id/domain/entities/movie.dart';
import 'package:flutter_flix_id/presentation/widgets/network_image_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> movieList({
  required String title,
  void Function(Movie movie)? onTap,
  required AsyncValue<List<Movie>> movies,
}) => [
  Padding(
    padding: const EdgeInsets.only(left: 24, bottom: 10),
    child: Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ),
  SizedBox(
    height: 228,
    child: movies.when(
      data:
          (data) => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  data
                      .map(
                        (movie) => Padding(
                          padding: EdgeInsets.only(
                            left: movie == data.first ? 24 : 10,
                            right: movie == data.last ? 24 : 0,
                          ),
                          child: NetworkImageCard(
                            imageUrl:
                                'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                            fit: BoxFit.contain,
                            onTap: () => onTap!(movie),
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const Center(child: CircularProgressIndicator()),
    ),
  ),
];
