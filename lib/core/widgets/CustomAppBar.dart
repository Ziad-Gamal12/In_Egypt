// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/core/utils/images.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.appBartitle});
  final String appBartitle;

  @override
  AppBar build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      leadingWidth: 40,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: isDark ? Colors.grey[990] : Colors.white,
      leading: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: InkWell(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: SvgPicture.asset(
            Assets.assetsIconsArrowLeftBack,
            height: 20,
            width: 20,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      title: Text(
        appBartitle,
        style: AppTextStyles(context)
            .bold19
            .copyWith(color: isDark ? Colors.white : Colors.black),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
