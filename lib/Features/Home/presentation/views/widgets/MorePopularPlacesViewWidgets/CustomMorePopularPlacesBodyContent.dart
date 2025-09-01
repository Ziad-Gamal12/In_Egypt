import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/presentation/manager/popular_places_cubit/popular_places_cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/MorePopularPlacesViewWidgets/CustomMorePopularPlacesGridView.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';

class CustomMorePopularPlacesBodyContent extends StatefulWidget {
  const CustomMorePopularPlacesBodyContent({super.key});

  @override
  State<CustomMorePopularPlacesBodyContent> createState() =>
      _CustomMorePopularPlacesBodyContentState();
}

class _CustomMorePopularPlacesBodyContentState
    extends State<CustomMorePopularPlacesBodyContent> {
  List<PlaceEntity> popularPlaces = [];
  double mainAxisSpacing = 10;
  double crossAxisSpacing = 10;
  late ScrollController scrollController;
  bool isLoadMore = true;
  @override
  void initState() {
    scrollController = ScrollController();
    final cubit = context.read<PopularPlacesCubit>();
    scrollController.addListener(() {
      bool checker = scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          isLoadMore &&
          cubit.state is! PlacesGetPopularPlacesLoading;
      if (checker) {
        cubit.getPopularPlaces(isPaginated: true);
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
    return BlocListener<PopularPlacesCubit, PopularPlacesState>(
        listener: (context, state) {
          if (state is PlacesGetPopularPlacesSuccess) {
            if (!isLoadMore && state.getplacesResponseEntity.hasMore) {
              return;
            }
            setState(() {
              popularPlaces.addAll(state.getplacesResponseEntity.places);
              isLoadMore = state.getplacesResponseEntity.hasMore;
            });
          }
        },
        child: CustomMorePopularPlacesGridView(
          scrollController: scrollController,
          places: popularPlaces,
        ));
  }
}
