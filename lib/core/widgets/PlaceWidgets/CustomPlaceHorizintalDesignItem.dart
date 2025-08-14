import 'package:flutter/material.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceHorizintalDesignInfo%20copy.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceImage.dart';

class CustomPlaceHorizintalDesignItem extends StatelessWidget {
  const CustomPlaceHorizintalDesignItem({super.key, required this.place});
  final PlaceEntity place;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 315 / 155,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
            color: Colors.white,
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
                  place: place,
                ))
          ],
        ),
      ),
    );
  }
}
