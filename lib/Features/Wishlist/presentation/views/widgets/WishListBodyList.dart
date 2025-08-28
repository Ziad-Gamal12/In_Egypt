import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Wishlist/presentation/views/widgets/MyWishListSliverList.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';

class WishListBodyList extends StatelessWidget {
  final List<PlaceEntity> places;
  final Map<String, bool> favouritePlaces;

  const WishListBodyList(
      {super.key, required this.places, required this.favouritePlaces});

  @override
  Widget build(BuildContext context) {
    return MyWishListSliverList(
        places: places, favouritePlaces: favouritePlaces);
  }
}
