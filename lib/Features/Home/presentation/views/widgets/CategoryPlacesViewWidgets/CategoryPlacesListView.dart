import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Home/presentation/manager/places_categories_cubit/places_categories_cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/PlaceDetailsView.dart';
import 'package:in_egypt/Features/Wishlist/presentation/manager/cubit/wish_list_cubit.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/CustomErrorWidget.dart';
import 'package:in_egypt/core/widgets/EmptyWidget.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceHorizintalDesignItem.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryPlacesListView extends StatefulWidget {
  const CategoryPlacesListView({super.key, required this.category});
  final String category;
  @override
  State<CategoryPlacesListView> createState() => _CategoryPlacesListViewState();
}

class _CategoryPlacesListViewState extends State<CategoryPlacesListView> {
  List<PlaceEntity> newestPlaces = [];
  Map<String, bool> favouritePlaces = {};
  late ScrollController scrollController;
  bool isLoadMore = true;
  @override
  void initState() {
    final cubit = context.read<PlacesCategoriesCubit>();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          isLoadMore &&
          cubit.state is! PlacesCategoriesGetPlacesByCategoryLoading) {
        cubit.getPlacesByCategory(isPaginated: true, category: widget.category);
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
          BlocListener<PlacesCategoriesCubit, PlacesCategoriesState>(
            listener: (context, state) {
              if (state is PlacesCategoriesGetPlacesByCategorySuccess) {
                if (!isLoadMore && state.response.hasMore) {
                  return;
                }
                setState(() {
                  newestPlaces.addAll(state.response.places);
                  isLoadMore = state.response.hasMore;
                });
                context
                    .read<WishListCubit>()
                    .checkFavouritePlaces(places: state.response.places);
              }
            },
          ),
          BlocListener<WishListCubit, WishListState>(
              listener: (context, state) {
            moreNewestPlacesWishListListenerHandler(state);
          })
        ],
        child: BlocBuilder<PlacesCategoriesCubit, PlacesCategoriesState>(
            builder: (context, state) {
          bool isLoading = state is PlacesCategoriesGetPlacesByCategoryLoading;
          List<PlaceEntity> places = getDisplayedPlaces(state);
          if (state is PlacesCategoriesGetPlacesByCategoryFailure) {
            return Center(
              child: CustomErrorWidget(
                message: state.errMessage,
              ),
            );
          }
          if (state is PlacesCategoriesGetPlacesByCategorySuccess &&
              newestPlaces.isEmpty) {
            return Center(
              child: EmptyWidget(),
            );
          }
          return Skeletonizer(
              enabled: isLoading,
              child: ListView.builder(
                key: PageStorageKey("categoryPlacesListView"),
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

  void moreNewestPlacesWishListListenerHandler(WishListState state) {
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
  }

  List<PlaceEntity> getDisplayedPlaces(PlacesCategoriesState state) {
    List<PlaceEntity> places =
        state is PlacesCategoriesGetPlacesByCategorySuccess
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
