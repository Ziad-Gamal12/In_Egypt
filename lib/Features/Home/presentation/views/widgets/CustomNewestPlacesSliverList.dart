import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Home/presentation/manager/newest_places_cubit/newest_places_cubit.dart';
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
    return BlocBuilder<NewestPlacesCubit, NewestPlacesState>(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: CircularProgressIndicator(
                    color: kMainColor,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
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
                          GoRouter.of(context).push(PlaceDetailsView.routeName,
                              extra: places[index]);
                        },
                        child: CustomPlaceHorizintalDesignItem(
                          place: places[index],
                        ))
                    .animate()
                    .moveY(begin: 50)
                    .fadeIn(duration: 1.seconds, delay: (index * 200).ms),
              );
            },
            itemCount: places.length);
      },
    );
  }
}
