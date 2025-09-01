import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/presentation/manager/newest_places_cubit/newest_places_cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/HorizintalPlacesListView.dart';
import 'package:in_egypt/Features/Wishlist/presentation/manager/wish_list_cubit/wish_list_cubit.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/CustomErrorWidget.dart';
import 'package:in_egypt/core/widgets/EmptyWidget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomMoreNewestPlacesBodyContent extends StatefulWidget {
  const CustomMoreNewestPlacesBodyContent({super.key});

  @override
  State<CustomMoreNewestPlacesBodyContent> createState() =>
      _CustomMoreNewestPlacesBodyContentState();
}

class _CustomMoreNewestPlacesBodyContentState
    extends State<CustomMoreNewestPlacesBodyContent> {
  final List<PlaceEntity> newestPlaces = [];
  final Map<String, bool> favouritePlaces = {};
  late final ScrollController scrollController;
  bool isLoadMore = true;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<NewestPlacesCubit>();
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.position.pixels >=
                scrollController.position.maxScrollExtent - 200 &&
            isLoadMore &&
            cubit.state is! PlacesGetNewestPlacesLoading) {
          cubit.getNewestPlaces(isPaginated: true);
        }
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<NewestPlacesCubit, NewestPlacesState>(
          listener: (context, state) {
            if (state is PlacesGetNewestPlacesSuccess) {
              if (!isLoadMore && state.getplacesResponseEntity.hasMore) return;

              setState(() {
                newestPlaces.addAll(state.getplacesResponseEntity.places);
                isLoadMore = state.getplacesResponseEntity.hasMore;
              });

              context.read<WishListCubit>().checkFavouritePlaces(
                    places: state.getplacesResponseEntity.places,
                  );
            }
          },
        ),
        BlocListener<WishListCubit, WishListState>(
          listener: (context, state) =>
              _handleWishListStateUpdates(state, favouritePlaces),
        ),
      ],
      child: BlocBuilder<NewestPlacesCubit, NewestPlacesState>(
        builder: (context, state) {
          final isLoading = state is PlacesGetNewestPlacesLoading;
          final isFirstLoading =
              state is PlacesGetNewestPlacesLoading && state.isFirstLoading;
          final places = _getDisplayedPlaces(state);

          if (state is PlacesGetNewestPlacesFailure) {
            return Center(child: CustomErrorWidget(message: state.errmessage));
          }

          if (state is PlacesGetNewestPlacesSuccess && newestPlaces.isEmpty) {
            return Center(child: EmptyWidget());
          }

          if (isFirstLoading) {
            return Skeletonizer(
              enabled: true,
              child: HorizintalPlacesListView(
                scrollController: scrollController,
                places: places,
                favouritePlaces: favouritePlaces,
              ),
            );
          }
          return HorizintalPlacesListView(
            scrollController: scrollController,
            places: places,
            favouritePlaces: favouritePlaces,
            showBottomLoader: isLoading, // لو pagination loading
          );
        },
      ),
    );
  }

  void _handleWishListStateUpdates(
    WishListState state,
    Map<String, bool> favouritePlaces,
  ) {
    setState(() {
      if (state is WishListCheckFavouritePlacesSuccess) {
        favouritePlaces.addAll(state.favouritePlaces);
      } else if (state is WishListAddPlaceToWishListSuccess) {
        favouritePlaces[state.placeId] = true;
      } else if (state is WishListRemovePlaceFromWishListSuccess) {
        favouritePlaces[state.placeId] = false;
      }
    });
  }

  List<PlaceEntity> _getDisplayedPlaces(NewestPlacesState state) {
    if (state is PlacesGetNewestPlacesSuccess) return newestPlaces;

    // dummy skeleton items
    return List.generate(
      6,
      (_) => PlaceEntity(
        category: "",
        description: "",
        id: '',
        images: const [],
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
