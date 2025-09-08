import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/presentation/manager/place_details-cubit/place_details-cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/AboutPlaceSection.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/CustomPlaceDetailsBookButton.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/CustomPlaceDetailsItemImage.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/CustomPlaceDetailsPlaceMap.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/CustomPlaceReviewsSliverList.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/CustomPlaceTitleAndRatingAndLocation.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/PlaceImagesSection.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/PlaceReviewsInfoAndAddReviewSection.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/Entities/PlaceReviewEntity.dart';

class PlaceDetailsViewBodyContent extends StatefulWidget {
  const PlaceDetailsViewBodyContent({super.key});

  @override
  State<PlaceDetailsViewBodyContent> createState() =>
      _PlaceDetailsViewBodyContentState();
}

class _PlaceDetailsViewBodyContentState
    extends State<PlaceDetailsViewBodyContent> {
  late ScrollController scrollController;
  bool isLoadMoreReviews = true;
  List<PlaceReviewEntity> reviews = [];
  @override
  void initState() {
    scrollController = ScrollController();
    context.read<PlaceDetailsCubit>().getPlaceReviews(
        placeId: context.read<PlaceEntity>().id, isPaginated: false);
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          isLoadMoreReviews &&
          context.read<PlaceDetailsCubit>().state
              is! PlacesGetPlaceReviewsLoading) {
        context.read<PlaceDetailsCubit>().getPlaceReviews(
            placeId: context.read<PlaceEntity>().id, isPaginated: true);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PlaceEntity place = context.read<PlaceEntity>();
    return BlocConsumer<PlaceDetailsCubit, PlaceDetailsState>(
        listener: (context, state) {
      if (state is PlacesGetPlaceReviewsSuccess) {
        if (!isLoadMoreReviews && state.response.hasMore) {
          return;
        }
        setState(() {
          reviews.addAll(state.response.reviews);
          isLoadMoreReviews = state.response.hasMore;
        });
      }
    }, builder: (context, state) {
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
                          imageUrl: place.images.isNotEmpty
                              ? context.read<PlaceEntity>().images[0]
                              : '',
                        ),
                      ),
                      SizedBox(height: 16),
                      CustomPlaceTitleAndRatingAndLocation(),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: AboutPlaceSection(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: PlaceImagesSection(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: CustomPlaceDetailsPlaceMap(),
                ),
                //Adisplay google map of the place here
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(
                    child: PlaceReviewsInfoAndAddReviewSection()),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                CustomPlaceReviewsSliverList(
                  reviews: reviews,
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: state is PlacesGetPlaceReviewsLoading &&
                          !state.isFirstLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: kMainColor,
                          ),
                        )
                      : SizedBox(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 100,
                  ),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomPlaceDetailsBookButton(
                place: place,
              )),
        ],
      );
    });
  }
}
