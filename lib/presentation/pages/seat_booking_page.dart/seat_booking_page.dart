import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_flix_id/domain/entities/movie_detail.dart';
import 'package:flutter_flix_id/domain/entities/transaction.dart';
import 'package:flutter_flix_id/presentation/pages/seat_booking_page.dart/methods/legend.dart';
import 'package:flutter_flix_id/presentation/pages/seat_booking_page.dart/methods/movie_screen.dart';
import 'package:flutter_flix_id/presentation/pages/seat_booking_page.dart/methods/seat_section.dart';
import 'package:flutter_flix_id/presentation/providers/router/router_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../misc/constants.dart';
import '../../misc/methods.dart';
import '../../widgets/back_navigation_bar.dart';
import '../../widgets/network_image_card.dart';
import '../../widgets/seat.dart';

class SeatBookingPage extends ConsumerStatefulWidget {
  final (MovieDetail, Transaction) transactionDetail;

  const SeatBookingPage({super.key, required this.transactionDetail});

  @override
  ConsumerState<SeatBookingPage> createState() => _SeatBookingPageState();
}

class _SeatBookingPageState extends ConsumerState<SeatBookingPage> {
  List<int> selectedSeats = [];
  List<int> reservedSeats = [];
  final int maxSeats = 8;

  @override
  void initState() {
    super.initState();

    Random random = Random();
    int reservedNumber = random.nextInt(36) + 1;

    while (reservedSeats.length < 8) {
      if (!reservedSeats.contains(reservedNumber)) {
        reservedSeats.add(reservedNumber);
      }
      reservedNumber = random.nextInt(36) + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final (movieDetail, transaction) = widget.transactionDetail;

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsetsGeometry.all(24),
            child: Column(
              children: [
                BackNavigationBar(
                  title: movieDetail.title,
                  onTap: () => ref.read(routerProvider),
                ),
                verticalSpaces(12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Image.network(
                        'https://image.tmdb.org/t/p/w500${movieDetail.backdropPath ?? movieDetail.posterPath}',
                        width: double.infinity,
                        height: (MediaQuery.of(context).size.width - 48) * 0.6,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            width: double.infinity,
                            height:
                                (MediaQuery.of(context).size.width - 48) * 0.6,
                            color: Colors.grey.shade300,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: double.infinity,
                            height:
                                (MediaQuery.of(context).size.width - 48) * 0.6,
                            color: Colors.grey,
                            child: const Center(
                              child: Icon(Icons.broken_image, size: 48),
                            ),
                          );
                        },
                      ),
                      Container(
                        height: 80,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black54],
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Text(
                          movieDetail.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                offset: Offset(1, 1),
                                blurRadius: 3,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Screen Bioskop
                movieScreen(),
                // Number of Seats
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SeatNumber 1 to 18
                    seatSection(
                      seatNumbers: List.generate(18, (index) => index + 1),
                      onTap: onSeatTap,
                      seatStatusChecker: seatStatusChecker,
                    ),
                    // SeatNumber 19 to 36
                    horizontalSpaces(30),
                    seatSection(
                      seatNumbers: List.generate(18, (index) => index + 19),
                      onTap: onSeatTap,
                      seatStatusChecker: seatStatusChecker,
                    ),
                  ],
                ),
                verticalSpaces(20),
                legend(),
                verticalSpaces(40),
                Text(
                  '${selectedSeats.length} of $maxSeats seats selected',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                verticalSpaces(40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: backgroundColor,
                      backgroundColor: saffron,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Next'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // when seat is tapped
  void onSeatTap(int seatNumber) {
    setState(() {
      if (selectedSeats.contains(seatNumber)) {
        selectedSeats.remove(seatNumber);
      } else {
        if (selectedSeats.length < maxSeats) {
          selectedSeats.add(seatNumber);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'You can only choose a maximum of $maxSeats seats!',
              ),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    });
  }

  // check seat status available, reserved, or selected
  SeatStatus seatStatusChecker(seatNumber) =>
      reservedSeats.contains(seatNumber)
          ? SeatStatus.reserved
          : selectedSeats.contains(seatNumber)
          ? SeatStatus.selected
          : SeatStatus.available;
}
