import 'package:flutter/material.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceHorizintalDesignItem.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WishListBodyLoadingList extends StatelessWidget {
  final List<PlaceEntity> fakePlaces;
  const WishListBodyLoadingList({super.key, required this.fakePlaces});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        itemCount: fakePlaces.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CustomPlaceHorizintalDesignItem(
              isFavourite: true,
              place: fakePlaces[index],
            ),
          );
        },
      ),
    );
  }
}
