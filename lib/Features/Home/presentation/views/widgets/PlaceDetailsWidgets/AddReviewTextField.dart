import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt/Features/Home/presentation/manager/place_details-cubit/place_details-cubit.dart';
import 'package:in_egypt/core/Entities/PlaceReviewEntity.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomTeaxtField.dart';

class AddReviewTextField extends StatelessWidget {
  const AddReviewTextField({
    super.key,
    required this.formKey,
    required this.placeId,
    required this.controller,
  });

  final GlobalKey<FormState> formKey;
  final String placeId;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    PlaceReviewEntity placeReviewEntity = context.read<PlaceReviewEntity>();
    return Customteaxtfield(
        onSaved: (val) {
          placeReviewEntity.review = val ?? '';
        },
        suffixIcon: IconButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                if (placeReviewEntity.rating != 0) {
                  context
                      .read<PlaceDetailsCubit>()
                      .addReview(placeId: placeId, review: placeReviewEntity);
                }
              }
            },
            icon: Icon(
              FontAwesomeIcons.paperPlane,
              color: Colors.amber,
            )),
        labelText: "اضافة مراجعة",
        obscureText: false,
        controller: controller,
        textInputType: TextInputType.text,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'الرجاء إدخال المراجعة';
          }
          return null;
        });
  }
}
