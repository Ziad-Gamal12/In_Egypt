// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceVerticalDesignItemContent.dart';

class CustomPlaceVerticalDesignItem extends StatefulWidget {
  const CustomPlaceVerticalDesignItem({super.key, required this.place});
  final PlaceEntity place;
  @override
  State<CustomPlaceVerticalDesignItem> createState() =>
      _CustomPlaceVerticalDesignItemState();
}

class _CustomPlaceVerticalDesignItemState
    extends State<CustomPlaceVerticalDesignItem> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isDark ? Colors.grey.shade900 : Colors.white,
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.grey.shade900 : Colors.grey.shade100,
            blurRadius: 50,
            spreadRadius: 10,
            offset: const Offset(5, 40),
          ),
        ],
      ),
      child: CustomPlaceVerticalDesignItemContent(place: widget.place),
    );
  }
}
