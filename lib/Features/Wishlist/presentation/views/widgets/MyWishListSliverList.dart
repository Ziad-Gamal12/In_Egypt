import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceHorizintalDesignItem.dart';

class MyWishListSliverList extends StatefulWidget {
  const MyWishListSliverList({
    super.key,
    required this.places,
  });
  final List<PlaceEntity> places;
  @override
  State<MyWishListSliverList> createState() => _MyWishListSliverListState();
}

class _MyWishListSliverListState extends State<MyWishListSliverList> {
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: widget.places.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CustomPlaceHorizintalDesignItem(
              isFavourite: true,
              place: widget.places[index],
            )
                .animate()
                .moveY(begin: 50)
                .fadeIn(duration: 1.seconds, delay: (index * 200).ms),
          );
        });
  }
}
