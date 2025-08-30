import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/AddReviewRatingStarIcon.dart';
import 'package:in_egypt/core/Entities/PlaceReviewEntity.dart';

class AddReviewRatingSelectionSection extends StatefulWidget {
  const AddReviewRatingSelectionSection({
    super.key,
  });

  @override
  State<AddReviewRatingSelectionSection> createState() =>
      _AddReviewRatingSelectionSectionState();
}

class _AddReviewRatingSelectionSectionState
    extends State<AddReviewRatingSelectionSection> {
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 20,
              spreadRadius: 1,
              offset: const Offset(0, 15),
            )
          ]),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = index;
                  });
                  context.read<PlaceReviewEntity>().rating = index + 1;
                },
                icon: AddReviewRatingStarIcon(
                    isSelected: (index) <= currentIndex))),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
