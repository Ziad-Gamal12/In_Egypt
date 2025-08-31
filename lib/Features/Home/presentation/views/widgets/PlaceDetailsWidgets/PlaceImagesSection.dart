import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/PlaceImagesListView.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:provider/provider.dart';

class PlaceImagesSection extends StatelessWidget {
  const PlaceImagesSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    PlaceEntity place = context.read<PlaceEntity>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "صور المكان",
          style:
              AppTextStyles(context).semiBold20.copyWith(color: Colors.black),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .1,
          child: PlaceImagesListView(
            imagesUrls: place.images,
          ),
        )
      ],
    );
  }
}
