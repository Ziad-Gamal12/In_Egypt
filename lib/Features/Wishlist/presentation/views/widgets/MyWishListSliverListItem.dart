import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Home/presentation/views/PlaceDetailsView.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceHorizintalDesignItem.dart';

class MyWishListSliverListItem extends StatelessWidget {
  const MyWishListSliverListItem({
    super.key,
    required this.place,
    required this.isFavourite,
  });

  final PlaceEntity place;
  final bool isFavourite;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(PlaceDetailsView.routeName, extra: place);
      },
      child: CustomPlaceHorizintalDesignItem(
        isFavourite: isFavourite,
        place: place,
      ),
    );
  }
}
