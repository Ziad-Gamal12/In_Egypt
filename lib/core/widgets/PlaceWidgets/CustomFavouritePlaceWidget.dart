// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Wishlist/presentation/manager/wish_list_cubit/wish_list_cubit.dart';
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
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.isFavourite) {
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
          widget.isFavourite
              ? Assets.assetsIconsFavouriteIcon
              : Assets.assetsIconsSolidfavouriteIcon,
        ),
      ),
    );
  }
}
