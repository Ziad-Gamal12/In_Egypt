import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Wishlist/presentation/manager/cubit/wish_list_cubit.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceHorizintalDesignItem.dart';

class MyWishListSliverList extends StatefulWidget {
  const MyWishListSliverList(
      {super.key, required this.places, required this.favouritePlaces});
  final List<PlaceEntity> places;
  final Map<String, bool> favouritePlaces;
  @override
  State<MyWishListSliverList> createState() => _MyWishListSliverListState();
}

class _MyWishListSliverListState extends State<MyWishListSliverList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListCubit, WishListState>(
      builder: (context, state) {
        return SliverList.builder(
            itemCount: widget.places.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomPlaceHorizintalDesignItem(
                  isFavourite:
                      widget.favouritePlaces[widget.places[index].id] ?? false,
                  place: widget.places[index],
                )
                    .animate()
                    .moveY(begin: 50)
                    .fadeIn(duration: 1.seconds, delay: (index * 200).ms),
              );
            });
      },
    );
  }
}
