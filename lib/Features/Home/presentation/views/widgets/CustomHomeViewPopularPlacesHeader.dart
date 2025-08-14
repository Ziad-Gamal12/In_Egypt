import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Home/presentation/views/MorePopularPlacesView.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class CustomHomeViewPopularPlacesHeader extends StatelessWidget {
  const CustomHomeViewPopularPlacesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        "الأكثر تقييما",
        style: AppTextStyles(context).semiBold20.copyWith(color: Colors.black),
      ),
      const Spacer(),
      Padding(
        padding: const EdgeInsets.all(16),
        child: InkWell(
          onTap: () {
            GoRouter.of(context).push(MorePopularPlacesView.routeName);
          },
          child: Text(
            "المزيد",
            style:
                AppTextStyles(context).regular14.copyWith(color: Colors.grey),
          ),
        ),
      ),
    ]);
  }
}
