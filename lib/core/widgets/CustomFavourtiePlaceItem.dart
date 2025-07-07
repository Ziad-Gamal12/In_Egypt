import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:in_egypt/core/utils/images.dart';
import 'package:in_egypt/core/widgets/CustomAddFavouritePlaceWidget.dart';
import 'package:in_egypt/core/widgets/CustomFavouritePlaceItemDetails.dart';

class CustomFavouritePlaceItem extends StatelessWidget {
  const CustomFavouritePlaceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 186 / 250,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
              image: DecorationImage(
                  image: AssetImage(
                    Assets.assetsImagesTestFavouritePlaceItemBackGround,
                  ),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: CustomAddFavouritePlaceWidget(),
                  )),
              Spacer(),
              Align(
                  alignment: Alignment.bottomRight,
                  child: CustomFavouritePlaceItemDetails().asGlass(
                      clipBorderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )))
            ],
          ),
        ));
  }
}
