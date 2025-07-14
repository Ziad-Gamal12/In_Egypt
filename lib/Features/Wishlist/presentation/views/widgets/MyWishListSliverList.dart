import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceHorizintalDesignItem.dart';

class MyWishListSliverList extends StatelessWidget {
  const MyWishListSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: CustomPlaceHorizintalDesignItem(
          isFavourite: true,
        )
            .animate()
            .moveY(begin: 50)
            .fadeIn(duration: 1.seconds, delay: (index * 200).ms),
      );
    });
  }
}
