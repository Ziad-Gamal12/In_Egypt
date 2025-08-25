import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Wishlist/presentation/manager/cubit/wish_list_cubit.dart';
import 'package:in_egypt/core/utils/images.dart';
import 'package:svg_flutter/svg.dart';

class CustomFavouritePlaceWidget extends StatefulWidget {
  const CustomFavouritePlaceWidget({
    super.key,
    required this.placeId,
  });

  final String placeId;

  @override
  State<CustomFavouritePlaceWidget> createState() =>
      _CustomFavouritePlaceWidgetState();
}

class _CustomFavouritePlaceWidgetState
    extends State<CustomFavouritePlaceWidget> {
  bool isFavourite = false;
  @override
  void initState() {
    context.read<WishListCubit>().isPlaceAddedToWishList(
          placeId: widget.placeId,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishListCubit, WishListState>(
      listener: (context, state) {
        if (state is WishListIsPlaceAddedToWishListSuccess &&
            state.placeId == widget.placeId) {
          isFavourite = state.isAdded;
        } else if (state is WishListAddPlaceToWishListSuccess &&
            state.placeId == widget.placeId) {
          isFavourite = true;
        } else if (state is WishListRemovePlaceFromWishListSuccess &&
            state.placeId == widget.placeId) {
          isFavourite = false;
        }
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            if (isFavourite) {
              context
                  .read<WishListCubit>()
                  .removePlaceFromWishList(placeId: widget.placeId);
            } else {
              context
                  .read<WishListCubit>()
                  .addPlaceToWishList(placeId: widget.placeId);
            }
          },
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: SvgPicture.asset(
              isFavourite
                  ? Assets.assetsIconsFavouriteIcon
                  : Assets.assetsIconsSolidfavouriteIcon,
            ),
          ),
        );
      },
    );
  }
}
