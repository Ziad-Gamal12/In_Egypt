import 'package:flutter/material.dart';
import 'package:in_egypt/core/widgets/CustomFavourtiePlaceItem.dart';

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
            child: CustomFavouritePlaceItem(),
          );
        });
  }
}
