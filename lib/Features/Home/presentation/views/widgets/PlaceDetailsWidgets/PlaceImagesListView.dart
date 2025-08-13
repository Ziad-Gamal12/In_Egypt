import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/presentation/manager/cubit/places_cubit.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceImage.dart';

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
                context.read<PlacesCubit>().selectPlaceMainImage(
                      url: imagesUrls[index],
                    );
              },
              child: CustomPlaceImage(imageUrl: imagesUrls[index]),
            ),
          ),
        );
      },
      itemCount: imagesUrls.length,
    );
  }
}
