import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Wishlist/presentation/views/widgets/MyWishListSliverList.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';

class WishListBodyList extends StatelessWidget {
  final List<PlaceEntity> places;
  const WishListBodyList({super.key, required this.places});

  @override
  Widget build(BuildContext context) {
    return MyWishListSliverList(places: places);
  }
}
