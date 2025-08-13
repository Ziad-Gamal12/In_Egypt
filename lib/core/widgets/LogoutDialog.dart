// logout_dialog.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/SignInView.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/services/FirebaseAuth_Service.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:in_egypt/core/widgets/CustomButton.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.white,
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
        child: Text(
          "هل انت متأكد من تسجيل الخروج؟",
          style: AppTextStyles(
            context,
          ).regular13.copyWith(color: kMainColor, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: Custombutton(
                onPressed: () async {
                  await firebaseAuthService().signout();

                  if (context.mounted) {
                    GoRouter.of(context).go(SignInView.routeName);
                  }
                },
                text: "تأكيد",
                color: kMainColor,
                textColor: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Custombutton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: "لا أرغب",
                color: Colors.white,
                textColor: kMainColor,
                side: const BorderSide(color: kMainColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
