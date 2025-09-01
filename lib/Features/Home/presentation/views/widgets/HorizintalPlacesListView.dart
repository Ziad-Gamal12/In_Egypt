import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/HorizintalPlaceListItem.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';

class HorizintalPlacesListView extends StatelessWidget {
  const HorizintalPlacesListView({
    super.key,
    required this.scrollController,
    required this.places,
    required this.favouritePlaces,
    this.showBottomLoader = false,
  });

  final ScrollController scrollController;
  final List<PlaceEntity> places;
  final Map<String, bool> favouritePlaces;
  final bool showBottomLoader;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const PageStorageKey("moreNewestPlacesListView"),
      controller: scrollController,
      itemCount: places.length + (showBottomLoader ? 1 : 0),
      itemBuilder: (context, index) {
        if (showBottomLoader && index == places.length) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(
                child: CircularProgressIndicator(
              color: kMainColor,
            )),
          );
        }
        return HorizintalPlaceListItem(
          place: places[index],
          isFavourite: favouritePlaces[places[index].id] ?? false,
        );
      },
    );
  }
}
