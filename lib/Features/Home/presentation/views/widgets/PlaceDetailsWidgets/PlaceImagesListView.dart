import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/presentation/manager/place_details-cubit/place_details-cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/PlaceImagesListViewItem.dart';

class PlaceImagesListView extends StatelessWidget {
  const PlaceImagesListView({super.key, required this.imagesUrls});
  final List<String> imagesUrls;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: AspectRatio(
            aspectRatio: 1,
            child: InkWell(
              onTap: () {
                context.read<PlaceDetailsCubit>().selectPlaceMainImage(
                      url: imagesUrls[index],
                    );
              },
              child: PlaceImagesListViewItem(imageUrl: imagesUrls[index]),
            ),
          ),
        );
      },
      itemCount: imagesUrls.length,
    );
  }
}
