import 'package:flutter/material.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPopularPlaceItem.dart';

class CusCustomPopularPlacesSliverList extends StatelessWidget {
  const CusCustomPopularPlacesSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 16),
            child: CustomPopularPlaceItem(),
          );
        },
        itemCount: 5);
  }
}
