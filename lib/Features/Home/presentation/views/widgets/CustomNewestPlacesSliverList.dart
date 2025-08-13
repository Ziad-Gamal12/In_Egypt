import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Home/presentation/manager/cubit/places_cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/PlaceDetailsView.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/CustomErrorWidget.dart';
import 'package:in_egypt/core/widgets/EmptyWidget.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceHorizintalDesignItem.dart';

class CustomNewestPlacesSliverList extends StatelessWidget {
  const CustomNewestPlacesSliverList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlacesCubit, PlacesState>(
      buildWhen: (previous, current) =>
          current is PlacesGetNewestPlacesLoading ||
          current is PlacesGetNewestPlacesSuccess ||
          current is PlacesGetNewestPlacesFailure,
      builder: (context, state) {
        if (state is PlacesGetNewestPlacesFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: CustomErrorWidget(
                message: state.errmessage,
              ),
            ),
          );
        } else if (state is PlacesGetNewestPlacesLoading) {
          return SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(
                color: kMainColor,
              ),
            ),
          );
        }
        List<PlaceEntity> places = state is PlacesGetNewestPlacesSuccess
            ? state.getplacesResponseEntity.places
            : [];
        if (places.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: EmptyWidget(),
            ),
          );
        }
        return SliverList.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 16),
                child: InkWell(
                  onTap: () {
                    GoRouter.of(context)
                        .push(PlaceDetailsView.routeName, extra: places[index]);
                  },
                  child: CustomPlaceHorizintalDesignItem(
                    place: places[index],
                  )
                      .animate()
                      .moveY(begin: 50)
                      .fadeIn(duration: 1.seconds, delay: (index * 200).ms),
                ),
              );
            },
            itemCount: places.length);
      },
    );
  }
}
