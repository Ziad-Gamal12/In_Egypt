import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/widgets/CustomProfileActionButtons.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/widgets/CustomProfilePicture.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/widgets/CustomButton.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kHorizentalPadding, vertical: kVerticalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomProfilePicture(),
            SizedBox(
              height: 80,
            ),
            CustomProfileActionButtons(),
            Custombutton(
                text: "تسجيل الخروج",
                color: Colors.amber,
                textColor: Colors.black,
                onPressed: () {}),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
