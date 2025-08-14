import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/presentation/manager/place_details-cubit/place_details-cubit.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/widgets/CustomCachedNetworkImage.dart';

class PlaceImagesListViewItem extends StatelessWidget {
  const PlaceImagesListViewItem({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceDetailsCubit, PlaceDetailsState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.transparent,
            border: (state is PlacesSelectPlaceMainImageSuccess &&
                    state.imageUrl == imageUrl)
                ? Border.all(color: kMainColor, width: 2)
                : null,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child:
                CustomCachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
          ),
        );
      },
    );
  }
}
