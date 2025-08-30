import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/CustomFillterPlacesCategoriesList.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlacesCategoriesHeader.dart';

class PlacesCategoriesSection extends StatelessWidget {
  const PlacesCategoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PlacesCategoriesHeader(),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .07,
          child: CustomFillterPlacesCategoriesList(),
        ),
      ],
    );
  }
}
