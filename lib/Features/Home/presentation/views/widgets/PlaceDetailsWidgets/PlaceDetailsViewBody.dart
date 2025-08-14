import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/AboutPlaceSection.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/CustomPlaceDetailsBookButton.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/CustomPlaceDetailsItemImage.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/CustomPlaceReviewsSliverList.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/CustomPlaceTitleAndRatingAndLocation.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/PlaceImagesSection.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/PlaceReviewsInfoAndAddReviewSection.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/CustomFlutterMap.dart';

class PlaceDetailsViewBody extends StatelessWidget {
  const PlaceDetailsViewBody({super.key, required this.place});
  final PlaceEntity place;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: kVerticalPadding, horizontal: kHorizentalPadding),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: CustomPlaceDetailsItemImage(
                        imageUrl: place.images[0],
                      ),
                    ),
                    SizedBox(height: 16),
                    CustomPlaceTitleAndRatingAndLocation(place: place),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: AboutPlaceSection(
                  description: place.description,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: PlaceImagesSection(
                  images: place.images,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: kMainColor, width: 1),
                  ),
                  child: AspectRatio(
                    aspectRatio: 2 / 1,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CustomFlutterMap(
                          latitude: place.latitude,
                          longitude: place.longitude,
                        )),
                  ),
                ),
              ),
              //Adisplay google map of the place here
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                  child: PlaceReviewsInfoAndAddReviewSection(
                rating: place.rating,
              )),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              CustomPlaceReviewsSliverList(
                reviews: place.placeReviewsEntity ?? [],
              )
            ],
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPlaceDetailsBookButton()),
      ],
    );
  }
}
