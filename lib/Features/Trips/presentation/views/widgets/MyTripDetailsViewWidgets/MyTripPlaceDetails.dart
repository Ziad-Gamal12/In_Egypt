import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Home/presentation/views/PlaceDetailsView.dart';
import 'package:in_egypt/Features/Wishlist/presentation/manager/wish_list_cubit/wish_list_cubit.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceHorizintalDesignItem.dart';

class MyTripPlaceDetails extends StatefulWidget {
  const MyTripPlaceDetails({super.key, required this.place});
  final PlaceEntity? place;

  @override
  State<MyTripPlaceDetails> createState() => _MyTripPlaceDetailsState();
}

class _MyTripPlaceDetailsState extends State<MyTripPlaceDetails> {
  Map<String, bool> isFavourite = {};
  @override
  void initState() {
    if (widget.place == null) return;
    context.read<WishListCubit>().checkFavouritePlaces(places: [widget.place!]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocListener<WishListCubit, WishListState>(
        listener: (context, state) {
          if (state is WishListCheckFavouritePlacesSuccess) {
            setState(() {
              isFavourite.addAll(state.favouritePlaces);
            });
          } else if (state is WishListAddPlaceToWishListSuccess) {
            setState(() {
              isFavourite[state.placeId] = true;
            });
          } else if (state is WishListRemovePlaceFromWishListSuccess) {
            setState(() {
              isFavourite[state.placeId] = false;
            });
          }
        },
        child: widget.place != null
            ? GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .push(PlaceDetailsView.routeName, extra: widget.place);
                },
                child: CustomPlaceHorizintalDesignItem(
                  place: widget.place!,
                  isFavourite: isFavourite[widget.place!.id] ?? false,
                ),
              )
            : Text(
                "لا يوجد مكان محجوز",
                style: AppTextStyles(context).regular14.copyWith(
                    color: isDark == true ? Colors.white : Colors.black),
              ));
  }
}
