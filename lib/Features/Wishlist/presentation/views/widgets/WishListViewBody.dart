import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/presentation/manager/search_places_cubit/search_places_cubit.dart';
import 'package:in_egypt/Features/Wishlist/presentation/manager/wish_list_cubit/wish_list_cubit.dart';
import 'package:in_egypt/Features/Wishlist/presentation/views/widgets/WishListBodyList.dart';
import 'package:in_egypt/Features/Wishlist/presentation/views/widgets/WishListBodyLoadMoreIndicator.dart';
import 'package:in_egypt/Features/Wishlist/presentation/views/widgets/WishListBodyLoadingList.dart';
import 'package:in_egypt/Features/Wishlist/presentation/views/widgets/WishListViewBodySearchSection.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/CustomErrorWidget.dart';

class WishListViewBody extends StatefulWidget {
  const WishListViewBody({super.key});

  @override
  State<WishListViewBody> createState() => _WishListViewBodyState();
}

class _WishListViewBodyState extends State<WishListViewBody> {
  late ScrollController scrollController;
  bool isLoadMore = true;
  bool isSearching = false;

  List<PlaceEntity> fetchedWishListPlaces = [];
  Map<String, bool> favouritePlaces = {};

  List<PlaceEntity> searchedWishListPlaces = [];
  Map<String, bool> searchedFavouritePlaces = {};

  @override
  void initState() {
    super.initState();
    _setupScrollController();
  }

  void _setupScrollController() {
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<WishListCubit>();
      cubit.getWishList(isPaginated: false);

      scrollController.addListener(() {
        if (scrollController.position.pixels >=
                scrollController.position.maxScrollExtent - 200 &&
            isLoadMore &&
            cubit.state is! WishListGetWishListLoading &&
            !isSearching) {
          cubit.getWishList(isPaginated: true);
        }
      });
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
        BlocListener<SearchPlacesCubit, SearchPlacesState>(
          listener: (context, state) {
            if (state is SearchPlacesSuccess) {
              searchedWishListPlaces.addAll(state.places);
              context
                  .read<WishListCubit>()
                  .checkFavouritePlaces(places: state.places);
            }
          },
        ),
        BlocListener<WishListCubit, WishListState>(
          listener: (context, state) {
            _handleWishListState(context, state);
          },
        ),
      ],
      child: BlocBuilder<WishListCubit, WishListState>(
        builder: (context, state) {
          if (state is WishListGetWishListFailure) {
            return Center(child: CustomErrorWidget(message: state.errMessage));
          }

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kHorizentalPadding,
              vertical: kVerticalPadding,
            ),
            child: CustomScrollView(
              key: const PageStorageKey('wishListScroll'),
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: WishListViewBodySearchSection(
                    isSearching: (val) {
                      setState(() {
                        searchedWishListPlaces.clear();
                        searchedFavouritePlaces.clear();
                        isSearching = val;
                      });
                    },
                  ),
                ),
                if (state is WishListGetWishListLoading && state.isFirstLoad)
                  SliverToBoxAdapter(
                    child: WishListBodyLoadingList(
                      fakePlaces: _generateFakeLoadingPlaces(),
                    ),
                  )
                else
                  WishListBodyList(
                    favouritePlaces:
                        isSearching ? searchedFavouritePlaces : favouritePlaces,
                    places: isSearching
                        ? searchedWishListPlaces
                        : fetchedWishListPlaces,
                  ),
                SliverToBoxAdapter(
                  child: WishListBodyLoadMoreIndicator(
                    isLoading: state is WishListGetWishListLoading &&
                        !state.isFirstLoad,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _handleWishListState(BuildContext context, WishListState state) {
    if (state is WishListGetWishListSuccess) {
      if (!isLoadMore && state.response.hasMore) return;
      isLoadMore = state.response.hasMore;
      fetchedWishListPlaces.addAll(state.response.places);
      context
          .read<WishListCubit>()
          .checkFavouritePlaces(places: state.response.places);
      setState(() {});
    } else if (state is WishListCheckFavouritePlacesSuccess) {
      if (isSearching) {
        searchedFavouritePlaces.addAll(state.favouritePlaces);
      } else {
        favouritePlaces.addAll(state.favouritePlaces);
      }
      setState(() {});
    } else if (state is WishListAddPlaceToWishListSuccess) {
      final placeId = state.placeId;
      if (isSearching) {
        searchedFavouritePlaces[placeId] = true;
      } else {
        favouritePlaces[placeId] = true;
      }
      setState(() {});
    } else if (state is WishListRemovePlaceFromWishListSuccess) {
      final placeId = state.placeId;
      if (isSearching) {
        searchedFavouritePlaces[placeId] = false;
      } else {
        favouritePlaces[placeId] = false;
      }
      setState(() {});
    }
  }

  List<PlaceEntity> _generateFakeLoadingPlaces() {
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
