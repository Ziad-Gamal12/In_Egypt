import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Home/presentation/views/PlaceDetailsView.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceVerticalDesignItem.dart';

class CustomPopularPlacesListView extends StatelessWidget {
  const CustomPopularPlacesListView({super.key, required this.places});
  final List<PlaceEntity> places;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: places.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsGeometry.only(left: 10),
            child: AspectRatio(
                aspectRatio: 186 / 250,
                child: InkWell(
                  onTap: () {
                    GoRouter.of(context)
                        .push(PlaceDetailsView.routeName, extra: places[index]);
                  },
                  child: CustomPlaceVerticalDesignItem(
                    place: places[index],
                  )
                      .animate()
                      .moveX(begin: -50)
                      .fadeIn(duration: 1.seconds, delay: (index * 200).ms),
                )),
          );
        });
  }
}
