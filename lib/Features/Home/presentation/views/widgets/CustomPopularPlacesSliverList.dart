import 'package:flutter/material.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPopularPlaceItem.dart';

class CusCustomPopularPlacesSliverList extends StatelessWidget {
  const CusCustomPopularPlacesSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemBuilder: (context, index) {
          return CustomPopularPlaceItem();
        },
        itemCount: 5);
  }
}
