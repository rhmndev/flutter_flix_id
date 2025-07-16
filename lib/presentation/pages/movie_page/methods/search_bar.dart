import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget searchBar(BuildContext context) => Row(
  children: [
    Container(
      width: MediaQuery.of(context).size.width - 24 - 24 - 90,
      height: 50,
      margin: EdgeInsets.only(left: 24, right: 10),
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Color(0xFF252836),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        style: TextStyle(color: Colors.grey.shade400),
        decoration: InputDecoration(
          hintText: 'Search movie....',
          border: InputBorder.none,
          icon: Icon(Icons.search),
        ),
      ),
    ),
    SizedBox(
      width: 80,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
        ),
        child: const Center(child: Icon(Icons.search)),
      ),
    ),
  ],
);
