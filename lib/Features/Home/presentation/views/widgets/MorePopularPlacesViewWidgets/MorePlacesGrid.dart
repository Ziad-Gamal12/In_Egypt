import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/MorePopularPlacesViewWidgets/MorePlacesGridItem.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/helpers/_GridHelper.dart';

class MorePlacesGrid extends StatefulWidget {
  MorePlacesGrid({
    super.key,
    required this.scrollController,
    required this.constraints,
    required this.places,
    this.showBottomLoader = false,
  });

  final ScrollController scrollController;
  final BoxConstraints constraints;
  final List<PlaceEntity> places;
  bool showBottomLoader;
  @override
  State<MorePlacesGrid> createState() => _MorePlacesGridState();
}

class _MorePlacesGridState extends State<MorePlacesGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: const PageStorageKey("MorePopularPlacesView"),
      controller: widget.scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            GridHelper.getCrossAxisCount(widget.constraints.maxWidth),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio:
            GridHelper.getAspectRatio(maxWidth: widget.constraints.maxWidth),
      ),
      itemCount: widget.places.length + (widget.showBottomLoader ? 1 : 0),
      itemBuilder: (context, index) {
        if (widget.showBottomLoader && index == widget.places.length) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(
                child: CircularProgressIndicator(
              color: kMainColor,
            )),
          );
        }
        return MorePlacesGridItem(place: widget.places[index]);
      },
    );
  }
}
