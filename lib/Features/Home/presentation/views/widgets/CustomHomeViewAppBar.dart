import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/helpers/getUserData.dart';
import 'package:in_egypt/core/utils/images.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:in_egypt/core/widgets/CustomCachedNetworkImage.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomHomeViewAppBar extends StatelessWidget {
  const CustomHomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    UserEntity user = getUserData();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: isDark ? Colors.grey[900] : Colors.grey[50],
          radius: 30,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: CustomCachedNetworkImage(imageUrl: user.photoUrl),
              )),
        ),
        SizedBox(
          width: 10,
        ),
        Text.rich(
          TextSpan(
            text: "مرحبا بعودك, ",
            style:
                AppTextStyles(context).semiBold20.copyWith(color: Colors.grey),
            children: [
              TextSpan(
                text: user.firstName,
                style:
                    AppTextStyles(context).bold20.copyWith(color: kMainColor),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SvgPicture.asset(Assets.assetsIconsNotificationIcon,
              height: 30, width: 30),
        ),
      ],
    );
  }
}
