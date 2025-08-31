import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/presentation/manager/place_details-cubit/place_details-cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/CustomReviewItem.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/Entities/PlaceReviewEntity.dart';
import 'package:in_egypt/core/widgets/CustomErrorWidget.dart';
import 'package:in_egypt/core/widgets/CustomNoReviewsWidget.dart';

class CustomPlaceReviewsSliverList extends StatelessWidget {
  const CustomPlaceReviewsSliverList({
    super.key,
    required this.reviews,
  });
  final List<PlaceReviewEntity> reviews;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceDetailsCubit, PlaceDetailsState>(
      builder: (context, state) {
        if (state is PlacesGetPlaceReviewsFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: CustomErrorWidget(message: state.errMessage),
            ),
          );
        } else if (state is PlacesGetPlaceReviewsLoading &&
            state.isFirstLoading) {
          return SliverToBoxAdapter(
            child: CircularProgressIndicator(
              color: kMainColor,
            ),
          );
        } else {
          if (reviews.isEmpty) {
            return const SliverToBoxAdapter(
              child: CustomNoReviewsWidget(),
            );
          } else {
            return SliverList.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomReviewItem(
                  placeReviewEntity: reviews[index],
                ),
              ),
            );
          }
        }
      },
    );
  }
}
