import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/AddReviewRatingSelectionSection.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/AddReviewTextField.dart';
import 'package:in_egypt/core/Entities/PlaceReviewEntity.dart';
import 'package:in_egypt/core/helpers/getUserData.dart';
import 'package:provider/provider.dart';

class AddReviewSection extends StatefulWidget {
  const AddReviewSection({
    super.key,
    required this.placeId,
  });
  final String placeId;
  @override
  State<AddReviewSection> createState() => _AddReviewSectionState();
}

class _AddReviewSectionState extends State<AddReviewSection> {
  late TextEditingController controller;
  late GlobalKey<FormState> formKey;
  late PlaceReviewEntity review;
  bool isAddingReview = false;
  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void init() {
    formKey = GlobalKey<FormState>();
    controller = TextEditingController();
    review = PlaceReviewEntity(
        user: getUserData(), rating: 0, review: "", createdAt: DateTime.now());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.addListener(() {
        if (controller.text.isNotEmpty) {
          setState(() {
            isAddingReview = true;
          });
        } else {
          setState(() {
            isAddingReview = false;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Provider.value(
        value: review,
        child: Column(
          children: [
            AddReviewTextField(
                formKey: formKey,
                placeId: widget.placeId,
                controller: controller),
            Visibility(
                visible: isAddingReview,
                child: AddReviewRatingSelectionSection()),
          ],
        ),
      ),
    );
  }
}
