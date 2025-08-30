import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Home/domain/Entities/SelectPlaceCategoryEntity.dart';
import 'package:in_egypt/Features/Home/presentation/views/CategoryPlacesView.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/SelectPlaceCategoryItem.dart';

class CustomFillterPlacesCategoriesList extends StatefulWidget {
  const CustomFillterPlacesCategoriesList({
    super.key,
  });
  @override
  State<CustomFillterPlacesCategoriesList> createState() =>
      _CustomFillterPlacesCategoriesListState();
}

class _CustomFillterPlacesCategoriesListState
    extends State<CustomFillterPlacesCategoriesList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: SelectPlaceCategoryEntity.placeCategories
          .asMap()
          .entries
          .map(
            (e) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .push(CategoryPlacesView.routeName, extra: e.value);
                },
                child: SelectPlaceCategoryItem(
                  e: e.value,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
