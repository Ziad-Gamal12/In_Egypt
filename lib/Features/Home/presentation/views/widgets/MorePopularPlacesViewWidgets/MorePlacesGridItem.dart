import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Home/presentation/views/PlaceDetailsView.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceVerticalDesignItem.dart';

class MorePlacesGridItem extends StatelessWidget {
  const MorePlacesGridItem({
    super.key,
    required this.place,
  });

  final PlaceEntity place;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(PlaceDetailsView.routeName, extra: place);
      },
      child: CustomPlaceVerticalDesignItem(place: place),
    );
  }
}
