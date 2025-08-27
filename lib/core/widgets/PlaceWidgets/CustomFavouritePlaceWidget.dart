import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Wishlist/presentation/manager/cubit/wish_list_cubit.dart';
import 'package:in_egypt/core/utils/images.dart';
import 'package:svg_flutter/svg.dart';

class CustomFavouritePlaceWidget extends StatefulWidget {
  CustomFavouritePlaceWidget({
    super.key,
    required this.placeId,
    required this.isFavourite,
  });
  bool isFavourite;
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isFavourite = widget.isFavourite;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WishListCubit, WishListState>(
        listener: (context, state) {
          if (state is WishListAddPlaceToWishListSuccess &&
              state.placeId == widget.placeId) {
            setState(() {
              isFavourite = true;
            });
          } else if (state is WishListRemovePlaceFromWishListSuccess &&
              state.placeId == widget.placeId) {
            setState(() {
              isFavourite = false;
            });
          }
        },
        child: InkWell(
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
        ));
  }
}
