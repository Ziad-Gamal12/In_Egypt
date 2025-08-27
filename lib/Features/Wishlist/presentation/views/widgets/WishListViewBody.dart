import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Wishlist/presentation/manager/cubit/wish_list_cubit.dart';
import 'package:in_egypt/Features/Wishlist/presentation/views/widgets/MyWishListSliverList.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/CustomErrorWidget.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomSearchTextField.dart';

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
  Map<String, bool> favouritePlaces = {};
  @override
  void initState() {
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
    super.initState();
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
      listener: (context, state) {
        if (state is WishListGetWishListSuccess) {
          if (!isLoadMore && state.response.hasMore) return;
          isLoadMore = state.response.hasMore;
          fetchedWishListPlaces.addAll(state.response.places);
          context
              .read<WishListCubit>()
              .checkFavouritePlaces(places: state.response.places);
          setState(() {});
        } else if (state is WishListCheckFavouritePlacesSuccess) {
          favouritePlaces.addAll(state.favouritePlaces);

          setState(() {});
        }
      },
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
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CustomSearchTextField(
                        controller: searchController,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
                MyWishListSliverList(
                  favouritePlaces: favouritePlaces,
                  places: fetchedWishListPlaces,
                )
              ],
            ));
      },
    );
  }
}
