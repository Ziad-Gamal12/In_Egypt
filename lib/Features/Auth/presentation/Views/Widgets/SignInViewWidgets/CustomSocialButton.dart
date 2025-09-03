// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:svg_flutter/svg.dart';

class CustomSocialButton extends StatelessWidget {
  final void Function() onPressed;
  final String iconpath;
  final String text;
  const CustomSocialButton({
    super.key,
    required this.onPressed,
    required this.iconpath,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return MaterialButton(
      height: 54,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color(0xffDDDFDF), width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(iconpath, width: 20, height: 20),
            const SizedBox(width: 53),
            Text(
              text,
              style: AppTextStyles(
                context,
              ).semiBold16.copyWith(
                  color:
                      isDark ? Colors.grey.shade300 : const Color(0xff0C0D0D)),
            ),
          ],
        ),
      ),
    );
  }
}
