// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class CustomProfileActionButton extends StatelessWidget {
  CustomProfileActionButton(
      {super.key,
      required this.title,
      this.trailing,
      this.iconData,
      this.onTap});
  final String title;
  Widget? trailing;
  IconData? iconData;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 6 / 1,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppTextStyles(context)
                    .semiBold16
                    .copyWith(color: Colors.black),
              ),
              if (iconData != null && trailing == null)
                Icon(iconData, color: Colors.black, size: 35)
              else if (trailing != null && iconData == null)
                trailing!
              else
                SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
