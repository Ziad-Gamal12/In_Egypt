import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceVerticalDesignItem.dart';

class CustomHomeViewFavouritePlacesListView extends StatelessWidget {
  const CustomHomeViewFavouritePlacesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsGeometry.only(left: 10),
            child: AspectRatio(
                aspectRatio: 186 / 250,
                child: CustomPlaceVerticalDesignItem(
                  isFavourite: true,
                )
                    .animate()
                    .moveX(begin: -50)
                    .fadeIn(duration: 1.seconds, delay: (index * 200).ms)),
          );
        });
  }
}
