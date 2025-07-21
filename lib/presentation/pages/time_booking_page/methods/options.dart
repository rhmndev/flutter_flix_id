
import 'package:flutter/material.dart';
import 'package:flutter_flix_id/presentation/misc/methods.dart';
import 'package:flutter_flix_id/presentation/widgets/selectable_card.dart';

List<Widget> options<T>({
  required String title,
  required List<T> options,
  required T? selectedItem,
  String Function(T object)? converter,
  bool Function(T object)? isOptionEnabled,
  required void Function(T object) onTap,
}) => [
  Padding(
    padding: EdgeInsets.only(left: 24),
    child: Text(
      title,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ),
  verticalSpaces(10),
  SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children:
          options
              .map(
                (e) => Padding(
                  padding: EdgeInsets.only(left: e == options.first ? 24 : 0, right: e == options.last ? 24 : 10),
                  child: SelectableCard(
                    text: converter != null ? converter(e) : e.toString(),
                    isSelected: e == selectedItem,
                    isEnabled: isOptionEnabled?.call(e) ?? true,
                    onTap: () => onTap(e),
                  ),
                ),
              )
              .toList(),
    ),
  ),
];
