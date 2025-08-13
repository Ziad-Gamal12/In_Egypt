import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/presentation/manager/cubit/places_cubit.dart';
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
    return BlocBuilder<PlacesCubit, PlacesState>(
      buildWhen: (previous, current) =>
          current is PlacesGetPopularPlacesLoading ||
          current is PlacesGetPopularPlacesSuccess ||
          current is PlacesGetPopularPlacesFailure,
      builder: (context, state) {
        if (state is PlacesGetPopularPlacesFailure) {
          return Center(
            child: CustomErrorWidget(
              message: state.errmessage,
            ),
          );
        }
        List<PlaceEntity> places = state is PlacesGetPopularPlacesSuccess
            ? state.getplacesResponseEntity.places
            : [];
        if (places.isEmpty) {
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
                ))
          ],
        );
      },
    );
  }
}
