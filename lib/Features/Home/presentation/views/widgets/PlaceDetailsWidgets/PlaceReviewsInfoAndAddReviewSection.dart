import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/CustomPlaceReviewsSectionHeader.dart';
import 'package:in_egypt/core/widgets/CustomTeaxtField.dart';

class PlaceReviewsInfoAndAddReviewSection extends StatelessWidget {
  const PlaceReviewsInfoAndAddReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPlaceReviewsSectionHeader(),
        const SizedBox(
          height: 10,
        ),
        Customteaxtfield(
            suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.paperPlane,
                  color: Colors.amber,
                )),
            labelText: "اضافة مراجعة",
            obscureText: false,
            textInputType: TextInputType.text,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'الرجاء إدخال المراجعة';
              }
              return null;
            })
      ],
    );
  }
}
