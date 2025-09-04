import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt/Features/Home/presentation/manager/place_details-cubit/place_details-cubit.dart';
import 'package:in_egypt/core/Entities/PlaceReviewEntity.dart';
import 'package:in_egypt/core/helpers/ShowSnackBar.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomTeaxtField.dart';

class AddReviewTextField extends StatefulWidget {
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
  State<AddReviewTextField> createState() => _AddReviewTextFieldState();
}

class _AddReviewTextFieldState extends State<AddReviewTextField> {
  @override
  Widget build(BuildContext context) {
    PlaceReviewEntity placeReviewEntity = context.read<PlaceReviewEntity>();
    return BlocConsumer<PlaceDetailsCubit, PlaceDetailsState>(
      listener: (context, state) {
        if (state is PlacesAddReviewSuccess) {
          widget.controller.clear();
          placeReviewEntity.rating = 0;
          placeReviewEntity.review = '';
          setState(() {});

          showSuccessSnackBar(
              context: context, message: "تم اضافة المراجعة بنجاح");
        } else if (state is PlacesAddReviewFailure) {
          showErrorSnackBar(context: context, message: state.errMessage);
        }
      },
      builder: (context, state) {
        return Customteaxtfield(
            onSaved: (val) {
              placeReviewEntity.review = val ?? '';
            },
            suffixIcon: IconButton(
                onPressed: () {
                  if (widget.formKey.currentState!.validate()) {
                    widget.formKey.currentState!.save();
                    if (placeReviewEntity.rating != 0) {
                      context.read<PlaceDetailsCubit>().addReview(
                          placeId: widget.placeId, review: placeReviewEntity);
                    }
                  }
                },
                icon: state is PlacesAddReviewLoading
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                          color: Colors.amber,
                        ),
                      )
                    : Icon(
                        FontAwesomeIcons.paperPlane,
                        color: Colors.amber,
                      )),
            labelText: "اضافة مراجعة",
            obscureText: false,
            controller: widget.controller,
            textInputType: TextInputType.text,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'الرجاء إدخال المراجعة';
              }
              return null;
            });
      },
    );
  }
}
