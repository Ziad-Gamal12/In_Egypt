import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Home/presentation/manager/popular_places_cubit/popular_places_cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/PlaceDetailsView.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/CustomErrorWidget.dart';
import 'package:in_egypt/core/widgets/EmptyWidget.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceVerticalDesignItem.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomMorePopularPlacesGridView extends StatefulWidget {
  const CustomMorePopularPlacesGridView({super.key});

  @override
  State<CustomMorePopularPlacesGridView> createState() =>
      _CustomMorePopularPlacesGridViewState();
}

class _CustomMorePopularPlacesGridViewState
    extends State<CustomMorePopularPlacesGridView> {
  List<PlaceEntity> popularPlaces = [];
  double mainAxisSpacing = 10;
  double crossAxisSpacing = 10;
  late ScrollController scrollController;
  bool isLoadMore = true;
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          isLoadMore) {
        context.read<PopularPlacesCubit>().getPopularPlaces(isPaginated: true);
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
    return BlocConsumer<PopularPlacesCubit, PopularPlacesState>(
        listener: (context, state) {
      if (state is PlacesGetPopularPlacesSuccess) {
        if (!isLoadMore && state.getplacesResponseEntity.hasMore) {
          isLoadMore = false;
        }
        setState(() {
          popularPlaces.addAll(state.getplacesResponseEntity.places);
          isLoadMore = state.getplacesResponseEntity.hasMore;
        });
      }
    }, builder: (context, state) {
      bool isLoading = state is PlacesGetPopularPlacesLoading;
      List<PlaceEntity> places = getDisplayedPlaces(state);
      if (state is PlacesGetPopularPlacesFailure) {
        return Center(
          child: CustomErrorWidget(
            message: state.errmessage,
          ),
        );
      }
      if (state is PlacesGetPopularPlacesSuccess && popularPlaces.isEmpty) {
        return Center(
          child: EmptyWidget(),
        );
      }
      return LayoutBuilder(
        builder: (context, constraints) => Skeletonizer(
            enabled: isLoading,
            child: GridView.builder(
              controller: scrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    getCrossAxisCount(maxWidth: constraints.maxWidth),
                mainAxisSpacing: mainAxisSpacing,
                crossAxisSpacing: crossAxisSpacing,
                childAspectRatio:
                    getAspectRatio(maxWidth: constraints.maxWidth),
              ),
              itemCount: places.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  GoRouter.of(context)
                      .push(PlaceDetailsView.routeName, extra: places[index]);
                },
                child: CustomPlaceVerticalDesignItem(
                  place: places[index],
                ),
              ),
            )),
      );
    });
  }

  int getCrossAxisCount({required double maxWidth}) {
    if (maxWidth >= 1024) {
      return 5;
    } else if (maxWidth >= 900) {
      return 4;
    } else if (maxWidth >= 600) {
      return 3;
    } else {
      return 2;
    }
  }

  double getAspectRatio({required double maxWidth}) {
    int crossAxisCount = getCrossAxisCount(maxWidth: maxWidth);
    int freeSpaceCount = crossAxisCount - 1;
    double freeSpaceWidth = mainAxisSpacing * freeSpaceCount;
    double availableWidth = maxWidth - freeSpaceWidth;
    double itemWidth = availableWidth / crossAxisCount;
    double itemHeight = itemWidth / 0.7;
    double aspectRatio = itemWidth / itemHeight;
    return aspectRatio;
  }

  List<PlaceEntity> getDisplayedPlaces(PopularPlacesState state) {
    List<PlaceEntity> places = state is PlacesGetPopularPlacesSuccess
        ? popularPlaces
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
