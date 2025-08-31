import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class AboutPlaceSection extends StatelessWidget {
  const AboutPlaceSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    PlaceEntity place = context.read<PlaceEntity>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "تفاصيل المكان",
          style:
              AppTextStyles(context).semiBold20.copyWith(color: Colors.black),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: Text(
            place.description,
            style:
                AppTextStyles(context).regular13.copyWith(color: Colors.grey),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
