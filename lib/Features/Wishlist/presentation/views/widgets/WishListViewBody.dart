import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Wishlist/presentation/manager/cubit/wish_list_cubit.dart';
import 'package:in_egypt/Features/Wishlist/presentation/views/widgets/WishListBodyHeader.dart';
import 'package:in_egypt/Features/Wishlist/presentation/views/widgets/WishListBodyList.dart';
import 'package:in_egypt/Features/Wishlist/presentation/views/widgets/WishListBodyLoadMoreIndicator.dart';
import 'package:in_egypt/Features/Wishlist/presentation/views/widgets/WishListBodyLoadingList.dart';
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
  late TextEditingController searchController;
  bool isLoadMore = true;
  List<PlaceEntity> fetchedWishListPlaces = [];
  @override
  void initState() {
    handleInitState();
    super.initState();
  }

  void handleInitState() {
    scrollController = ScrollController();
    searchController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WishListCubit>().getWishList(isPaginated: false);
      scrollController.addListener(() {
        if (scrollController.position.pixels ==
                scrollController.position.maxScrollExtent - 200 &&
            isLoadMore) {
          context.read<WishListCubit>().getWishList(isPaginated: true);
        }
      });
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishListCubit, WishListState>(
      listener: wishListBlocListenerHandler,
      builder: (context, state) {
        if (state is WishListGetWishListFailure) {
          return Center(
            child: CustomErrorWidget(message: state.errMessage),
          );
        }
        return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kHorizentalPadding, vertical: kVerticalPadding),
            child: CustomScrollView(
              key: PageStorageKey('myywishList'),
              slivers: [
                SliverToBoxAdapter(
                    child: WishListBodyHeader(controller: searchController)),
                if (state is WishListGetWishListLoading && state.isFirstLoad)
                  SliverToBoxAdapter(
                      child: WishListBodyLoadingList(
                    fakePlaces: generateFakeLoadingPlaces(),
                  ))
                else
                  WishListBodyList(
                    places: fetchedWishListPlaces,
                  ),
                SliverToBoxAdapter(
                  child: WishListBodyLoadMoreIndicator(
                      isLoading: state is WishListGetWishListLoading &&
                          !state.isFirstLoad),
                )
              ],
            ));
      },
    );
  }

  void wishListBlocListenerHandler(context, state) {
    if (state is WishListGetWishListSuccess) {
      if (!isLoadMore && state.response.hasMore) return;
      isLoadMore = state.response.hasMore;
      fetchedWishListPlaces.addAll(state.response.places);
      setState(() {});
    }
  }

  List<PlaceEntity> generateFakeLoadingPlaces() {
    return List.generate(10, (index) {
      return PlaceEntity(
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
          ticketPrice: 0);
    });
  }
}
