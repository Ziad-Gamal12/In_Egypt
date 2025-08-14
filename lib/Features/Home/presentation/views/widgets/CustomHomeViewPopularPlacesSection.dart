import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/presentation/manager/popular_places_cubit/popular_places_cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/CustomHomeViewPopularPlacesHeader.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/CustomPopularPlacesListView.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/CustomErrorWidget.dart';
import 'package:in_egypt/core/widgets/EmptyWidget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomHomeViewPopularPlacesSection extends StatefulWidget {
  const CustomHomeViewPopularPlacesSection({
    super.key,
  });

  @override
  State<CustomHomeViewPopularPlacesSection> createState() =>
      _CustomHomeViewPopularPlacesSectionState();
}

class _CustomHomeViewPopularPlacesSectionState
    extends State<CustomHomeViewPopularPlacesSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularPlacesCubit, PopularPlacesState>(
      builder: (context, state) {
        List<PlaceEntity> places = getDisplayedPlaces(state);
        if (state is PlacesGetPopularPlacesFailure) {
          return Center(
            child: CustomErrorWidget(
              message: state.errmessage,
            ),
          );
        }
        if (state is PlacesGetPopularPlacesSuccess &&
            state.getplacesResponseEntity.places.isEmpty) {
          return Center(
            child: EmptyWidget(),
          );
        }
        return Column(
          children: [
            CustomHomeViewPopularPlacesHeader(),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Skeletonizer(
                enabled: state is PlacesGetPopularPlacesLoading,
                child: CustomPopularPlacesListView(
                  places: places,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  List<PlaceEntity> getDisplayedPlaces(PopularPlacesState state) {
    List<PlaceEntity> places = state is PlacesGetPopularPlacesSuccess
        ? state.getplacesResponseEntity.places
        : List.generate(
            10,
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
                ticketPrice: 0));
    return places;
  }
}
