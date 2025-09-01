import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/presentation/manager/popular_places_cubit/popular_places_cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/MorePopularPlacesViewWidgets/MorePlacesGrid.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/CustomErrorWidget.dart';
import 'package:in_egypt/core/widgets/EmptyWidget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomMorePopularPlacesGridView extends StatelessWidget {
  const CustomMorePopularPlacesGridView({
    super.key,
    required this.scrollController,
    required this.places,
  });

  final ScrollController scrollController;
  final List<PlaceEntity> places;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return BlocBuilder<PopularPlacesCubit, PopularPlacesState>(
          builder: (context, state) {
            final isLoading = state is PlacesGetPopularPlacesLoading;
            final isFirstLoading =
                state is PlacesGetPopularPlacesLoading && state.isFirstLoading;
            final displayedPlaces = _getDisplayedPlaces(state);

            if (state is PlacesGetPopularPlacesFailure) {
              return Center(
                child: CustomErrorWidget(message: state.errmessage),
              );
            }

            if (state is PlacesGetPopularPlacesSuccess &&
                state.getplacesResponseEntity.places.isEmpty) {
              return Center(child: EmptyWidget());
            }
            return Skeletonizer(
              enabled: isFirstLoading,
              child: MorePlacesGrid(
                scrollController: scrollController,
                constraints: constraints,
                places: displayedPlaces,
                showBottomLoader: isLoading,
              ),
            );
          },
        );
      },
    );
  }

  List<PlaceEntity> _getDisplayedPlaces(PopularPlacesState state) {
    if (state is PlacesGetPopularPlacesSuccess) return places;
    return List.generate(
      6,
      (_) => PlaceEntity(
        category: "",
        description: "",
        id: '',
        images: [],
        latitude: 0,
        longitude: 0,
        name: "",
        rating: 0,
        location: "",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        ticketPrice: 0,
      ),
    );
  }
}
