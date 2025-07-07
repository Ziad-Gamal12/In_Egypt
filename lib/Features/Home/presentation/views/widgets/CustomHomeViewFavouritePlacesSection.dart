import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/CustomHomeViewFavouritePlacesHeader.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/CustomHomeViewFavouritePlacesListView.dart';

class CustomHomeViewFavouritePlacesSection extends StatelessWidget {
  const CustomHomeViewFavouritePlacesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHomeViewFavouritePlacesHeader(),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.29,
            child: CustomHomeViewFavouritePlacesListView())
      ],
    );
  }
}
