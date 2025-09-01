import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/presentation/manager/places_categories_cubit/places_categories_cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/HorizintalPlacesListView.dart';
import 'package:in_egypt/Features/Wishlist/presentation/manager/wish_list_cubit/wish_list_cubit.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/CustomErrorWidget.dart';
import 'package:in_egypt/core/widgets/EmptyWidget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryPlacesBodyContent extends StatefulWidget {
  const CategoryPlacesBodyContent({super.key, required this.category});
  final String category;

  @override
  State<CategoryPlacesBodyContent> createState() =>
      _CategoryPlacesBodyContentState();
}

class _CategoryPlacesBodyContentState extends State<CategoryPlacesBodyContent> {
  final List<PlaceEntity> categoryPlaces = [];
  final Map<String, bool> favouritePlaces = {};
  late final ScrollController scrollController;
  bool isLoadMore = true;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<PlacesCategoriesCubit>();
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.position.pixels >=
                scrollController.position.maxScrollExtent - 200 &&
            isLoadMore &&
            cubit.state is! PlacesCategoriesGetPlacesByCategoryLoading) {
          cubit.getPlacesByCategory(
            isPaginated: true,
            category: widget.category,
          );
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
        BlocListener<PlacesCategoriesCubit, PlacesCategoriesState>(
          listener: (context, state) {
            if (state is PlacesCategoriesGetPlacesByCategorySuccess) {
              if (!isLoadMore && state.response.hasMore) return;

              setState(() {
                categoryPlaces.addAll(state.response.places);
                isLoadMore = state.response.hasMore;
              });

              context.read<WishListCubit>().checkFavouritePlaces(
                    places: state.response.places,
                  );
            }
          },
        ),
        BlocListener<WishListCubit, WishListState>(
          listener: (context, state) =>
              _handleWishListStateUpdates(state, favouritePlaces),
        ),
      ],
      child: BlocBuilder<PlacesCategoriesCubit, PlacesCategoriesState>(
        builder: (context, state) {
          final isLoading = state is PlacesCategoriesGetPlacesByCategoryLoading;
          final isFirstLoading =
              state is PlacesCategoriesGetPlacesByCategoryLoading &&
                  state.isFirstLoading;
          final places = _getDisplayedPlaces(state);

          if (state is PlacesCategoriesGetPlacesByCategoryFailure) {
            return Center(child: CustomErrorWidget(message: state.errMessage));
          }

          if (state is PlacesCategoriesGetPlacesByCategorySuccess &&
              categoryPlaces.isEmpty) {
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
            showBottomLoader: isLoading,
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

  List<PlaceEntity> _getDisplayedPlaces(PlacesCategoriesState state) {
    if (state is PlacesCategoriesGetPlacesByCategorySuccess) {
      return categoryPlaces;
    }

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
