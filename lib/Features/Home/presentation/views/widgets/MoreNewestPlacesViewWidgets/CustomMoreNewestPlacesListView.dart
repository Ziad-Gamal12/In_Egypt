import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Home/presentation/manager/newest_places_cubit/newest_places_cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/PlaceDetailsView.dart';
import 'package:in_egypt/Features/Wishlist/presentation/manager/cubit/wish_list_cubit.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/CustomErrorWidget.dart';
import 'package:in_egypt/core/widgets/EmptyWidget.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceHorizintalDesignItem.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomMoreNewestPlacesListView extends StatefulWidget {
  const CustomMoreNewestPlacesListView({super.key});

  @override
  State<CustomMoreNewestPlacesListView> createState() =>
      _CustomMoreNewestPlacesListViewState();
}

class _CustomMoreNewestPlacesListViewState
    extends State<CustomMoreNewestPlacesListView> {
  List<PlaceEntity> newestPlaces = [];
  Map<String, bool> favouritePlaces = {};
  late ScrollController scrollController;
  bool isLoadMore = true;
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          isLoadMore) {
        context.read<NewestPlacesCubit>().getNewestPlaces(isPaginated: true);
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
    return MultiBlocListener(
        listeners: [
          BlocListener<NewestPlacesCubit, NewestPlacesState>(
            listener: (context, state) {
              if (state is PlacesGetNewestPlacesSuccess) {
                if (!isLoadMore && state.getplacesResponseEntity.hasMore) {
                  return;
                }
                setState(() {
                  newestPlaces.addAll(state.getplacesResponseEntity.places);
                  isLoadMore = state.getplacesResponseEntity.hasMore;
                });
                context.read<WishListCubit>().checkFavouritePlaces(
                    places: state.getplacesResponseEntity.places);
              }
            },
          ),
          BlocListener<WishListCubit, WishListState>(
              listener: (context, state) {
            if (state is WishListCheckFavouritePlacesSuccess) {
              favouritePlaces.addAll(state.favouritePlaces);
              setState(() {});
            } else if (state is WishListAddPlaceToWishListSuccess) {
              setState(() {
                favouritePlaces[state.placeId] = true;
              });
            } else if (state is WishListRemovePlaceFromWishListSuccess) {
              setState(() {
                favouritePlaces[state.placeId] = false;
              });
            }
          })
        ],
        child: BlocBuilder<NewestPlacesCubit, NewestPlacesState>(
            builder: (context, state) {
          bool isLoading = state is PlacesGetNewestPlacesLoading;
          List<PlaceEntity> places = getDisplayedPlaces(state);
          if (state is PlacesGetNewestPlacesFailure) {
            return Center(
              child: CustomErrorWidget(
                message: state.errmessage,
              ),
            );
          }
          if (state is PlacesGetNewestPlacesSuccess && newestPlaces.isEmpty) {
            return Center(
              child: EmptyWidget(),
            );
          }
          return Skeletonizer(
              enabled: isLoading,
              child: ListView.builder(
                key: PageStorageKey("moreNewestPlacesListView"),
                controller: scrollController,
                itemCount: places.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    GoRouter.of(context)
                        .push(PlaceDetailsView.routeName, extra: places[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomPlaceHorizintalDesignItem(
                      place: places[index],
                      isFavourite: favouritePlaces[places[index].id] ?? false,
                    ),
                  ),
                ),
              ));
        }));
  }

  List<PlaceEntity> getDisplayedPlaces(NewestPlacesState state) {
    List<PlaceEntity> places = state is PlacesGetNewestPlacesSuccess
        ? newestPlaces
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
