import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class CustomMyTripItem extends StatelessWidget {
  const CustomMyTripItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 325 / 138,
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey, width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "أهرامات الجيزة",
                style: AppTextStyles(context)
                    .semiBold20
                    .copyWith(color: Colors.black),
              ),
              Spacer(),
              Text(
                "\$500",
                style: AppTextStyles(context)
                    .regular16
                    .copyWith(color: Colors.red),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.solidCalendarCheck,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "12/12/2022",
                    style: AppTextStyles(context)
                        .regular16
                        .copyWith(color: Colors.black),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
