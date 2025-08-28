import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/presentation/manager/search_places_cubit/search_places_cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/CustomSearchingPlacesWidgetContentHeader.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/CustomSearchingPlacesWidgetContentSliverList.dart';
import 'package:in_egypt/Features/Wishlist/presentation/manager/cubit/wish_list_cubit.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/widgets/CustomErrorWidget.dart';

class CustomSearchingPlacesWidgetContent extends StatefulWidget {
  const CustomSearchingPlacesWidgetContent({super.key});

  @override
  State<CustomSearchingPlacesWidgetContent> createState() =>
      _CustomSearchingPlacesWidgetContentState();
}

class _CustomSearchingPlacesWidgetContentState
    extends State<CustomSearchingPlacesWidgetContent> {
  Map<String, bool> favouritePlaces = {};

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SearchPlacesCubit, SearchPlacesState>(
            listener: (context, state) {
          if (state is SearchPlacesSuccess) {
            context
                .read<WishListCubit>()
                .checkFavouritePlaces(places: state.places);
          }
        }),
        BlocListener<WishListCubit, WishListState>(
          listener: (context, state) {
            if (state is WishListCheckFavouritePlacesSuccess) {
              favouritePlaces.addAll(state.favouritePlaces);
            } else if (state is WishListAddPlaceToWishListSuccess) {
              setState(() {
                favouritePlaces[state.placeId] = true;
              });
            } else if (state is WishListRemovePlaceFromWishListSuccess) {
              setState(() {
                favouritePlaces[state.placeId] = false;
              });
            }
          },
        ),
      ],
      child: BlocBuilder<SearchPlacesCubit, SearchPlacesState>(
          builder: (context, state) {
        if (state is SearchPlacesFailure) {
          return Center(
              child: CustomErrorWidget(
            message: state.errMessage,
          ));
        } else if (state is SearchPlacesLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: kMainColor,
            ),
          );
        } else if (state is SearchPlacesSuccess) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: CustomSearchingPlacesWidgetContentHeader(
                count: state.places.length,
              )),
              SliverToBoxAdapter(child: SizedBox(height: 10)),
              CustomSearchingPlacesWidgetContentSliverList(
                places: state.places,
                favouritePlaces: favouritePlaces,
              ),
            ],
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
