import 'package:flutter/material.dart';
import 'package:flutter_flix_id/domain/entities/movie.dart';
import 'package:flutter_flix_id/presentation/misc/constants.dart';

List<Widget> background(Movie movie) => [
  Image.network(
    'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
    fit: BoxFit.cover,
    width: double.infinity,
    height: double.infinity,
  ),
  Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          backgroundColor.withOpacity(1),
          backgroundColor.withOpacity(0.7)
        ], begin: const Alignment(0, 0.3), end: Alignment.topCenter)),
      )
];