import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Home/presentation/views/PlaceDetailsView.dart';
import 'package:in_egypt/core/utils/images.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomAddFavouritePlaceWidget.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceItemInfo.dart';

class CustomPlaceItem extends StatelessWidget {
  const CustomPlaceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(PlaceDetailsView.routeName);
      },
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
                child: CustomPlaceItemInfo().asGlass(
                    blurX: 12,
                    blurY: 12,
                    clipBorderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )))
          ],
        ),
      ),
    );
  }
}
