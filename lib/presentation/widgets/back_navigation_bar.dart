import 'package:flutter/material.dart';
import 'package:flutter_flix_id/presentation/misc/methods.dart';

class BackNavigationBar extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const BackNavigationBar(  {super.key, this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: Image.asset('assets/back.png'),
            ),
          ),
        ),
        horizontalSpaces(20),
        SizedBox(
          width: MediaQuery.of(context).size.width - 60 - 48,
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
