// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceHorizintalDesignInfo.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceImage.dart';

class CustomPlaceHorizintalDesignItem extends StatelessWidget {
  const CustomPlaceHorizintalDesignItem(
      {super.key, required this.place, required this.isFavourite});
  final PlaceEntity place;
  final bool isFavourite;
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return AspectRatio(
      aspectRatio: 315 / 155,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
            color: isDark ? Colors.grey[900] : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xffF3F3F3), width: 1)),
        child: Row(
          children: [
            Expanded(
                flex: 86,
                child: AspectRatio(
                    aspectRatio: 86 / 116,
                    child: CustomPlaceImage(
                      imageUrl: place.images.isNotEmpty ? place.images[0] : '',
                    ))),
            SizedBox(
              width: 14,
            ),
            Expanded(
                flex: 179,
                child: CustomPlaceHorizintalDesignInfo(
                  isFavourite: isFavourite,
                  place: place,
                ))
          ],
        ),
      ),
    );
  }
}
