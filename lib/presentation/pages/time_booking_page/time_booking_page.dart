import 'package:flutter/material.dart';
import 'package:flutter_flix_id/domain/entities/movie_detail.dart';
import 'package:flutter_flix_id/presentation/widgets/selectable_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeBookingPage extends ConsumerStatefulWidget {
  final MovieDetail movieDetail;

  const TimeBookingPage(this.movieDetail, {super.key});

  @override
  ConsumerState<TimeBookingPage> createState() => _TimeBookingPageState();
}

class _TimeBookingPageState extends ConsumerState<TimeBookingPage> {
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          height: 50,
          child: SelectableCard(
            text: 'Mega Bekasi XXI',
            onTap: () {},
            isEnabled: false,
            isSelected: true,
          ),
        ),
      ),
    );
  }
}