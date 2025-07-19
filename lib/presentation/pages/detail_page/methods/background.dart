import 'package:flutter/material.dart';
import 'package:flutter_flix_id/domain/entities/movie.dart';

List<Widget> background(Movie movie) => [
  Image.network(
    'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
    fit: BoxFit.cover,
    width: double.infinity,
    height: double.infinity,
  ),
  Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment(0, 0.5),
        end: Alignment.topCenter,
        colors: [
          Colors.black,
          Colors.transparent,
          Colors.black,
          Colors.transparent
        ],
      ),
    ),
  ),
];