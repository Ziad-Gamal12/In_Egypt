import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/widgets/CustomProfileActionButtons.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/widgets/CustomProfilePicture.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/helpers/getUserData.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:in_egypt/core/widgets/CustomButton.dart';
import 'package:in_egypt/core/widgets/LogoutDialog.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kHorizentalPadding, vertical: kVerticalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomProfilePicture(),
            SizedBox(
              height: 70,
            ),
            Text(
              "${getUserData().firstName} ${getUserData().lastName}",
              style: AppTextStyles(context).bold20.copyWith(
                  color: isDark == true ? Colors.white : Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              getUserData().email,
              style: AppTextStyles(context).regular13.copyWith(
                  color: isDark == true ? Colors.white : Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            CustomProfileActionButtons(),
            Custombutton(
                text: "تسجيل الخروج",
                color: Colors.amber,
                textColor: Colors.black,
                onPressed: () {
                  showDialog(
                      context: context, builder: (context) => LogoutDialog());
                }),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
