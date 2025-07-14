import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceHorizintalDesignItem.dart';

class CusCustomPopularPlacesSliverList extends StatelessWidget {
  const CusCustomPopularPlacesSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 16),
            child: CustomPlaceHorizintalDesignItem(
              isFavourite: false,
            )
                .animate()
                .moveY(begin: 50)
                .fadeIn(duration: 1.seconds, delay: (index * 200).ms),
          );
        },
        itemCount: 5);
  }
}
