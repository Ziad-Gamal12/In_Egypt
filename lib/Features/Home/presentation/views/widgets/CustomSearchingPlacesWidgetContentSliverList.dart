import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Home/presentation/views/PlaceDetailsView.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/EmptyWidget.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceHorizintalDesignItem.dart';

class CustomSearchingPlacesWidgetContentSliverList extends StatelessWidget {
  const CustomSearchingPlacesWidgetContentSliverList(
      {super.key, required this.places, required this.favouritePlaces});
  final List<PlaceEntity> places;
  final Map<String, bool> favouritePlaces;
  @override
  Widget build(BuildContext context) {
    if (places.isNotEmpty) {
      return SliverList.builder(
          itemCount: places.length,
          itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 16),
              child: InkWell(
                  onTap: () {
                    GoRouter.of(context)
                        .push(PlaceDetailsView.routeName, extra: places[index]);
                  },
                  child: CustomPlaceHorizintalDesignItem(
                    place: places[index],
                    isFavourite: favouritePlaces[places[index].id] ?? false,
                  ))));
    } else {
      return SliverToBoxAdapter(
        child: Center(child: EmptyWidget()),
      );
    }
  }
}
