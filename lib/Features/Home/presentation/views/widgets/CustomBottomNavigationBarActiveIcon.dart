// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:svg_flutter/svg.dart';

class Custombottomnavigationbaractiveicon extends StatelessWidget {
  const Custombottomnavigationbaractiveicon({
    super.key,
    required this.iconPath,
    required this.title,
  });
  final String iconPath;
  final String title;
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
          color: isDark ? Colors.amber : const Color(0xff05080E),
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            iconPath,
            fit: BoxFit.scaleDown,
            color: isDark ? Colors.black : Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: AppTextStyles(context)
                .regular11
                .copyWith(color: isDark ? Colors.black : Colors.white),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    ).animate().moveY(begin: 20, duration: 600.ms).fadeIn(duration: 600.ms);
  }
}
