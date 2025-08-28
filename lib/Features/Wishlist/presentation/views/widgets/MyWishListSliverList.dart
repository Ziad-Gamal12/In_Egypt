import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/EmptyWidget.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceHorizintalDesignItem.dart';

class MyWishListSliverList extends StatefulWidget {
  const MyWishListSliverList({
    super.key,
    required this.places,
    required this.favouritePlaces,
  });
  final List<PlaceEntity> places;
  final Map<String, bool> favouritePlaces;

  @override
  State<MyWishListSliverList> createState() => _MyWishListSliverListState();
}

class _MyWishListSliverListState extends State<MyWishListSliverList> {
  @override
  Widget build(BuildContext context) {
    if (widget.places.isEmpty) {
      return SliverToBoxAdapter(child: EmptyWidget());
    } else {
      return SliverList.builder(
          itemCount: widget.places.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CustomPlaceHorizintalDesignItem(
                isFavourite:
                    widget.favouritePlaces[widget.places[index].id] ?? false,
                place: widget.places[index],
              )
                  .animate()
                  .fadeIn(duration: 200.ms, delay: (index * 200).ms)
                  .moveY(begin: 50),
            );
          });
    }
  }
}
