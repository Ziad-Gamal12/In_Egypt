// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Auth/presentation/manager/Custom_reset_password_cubit/Custom_reset_password_cubit.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:in_egypt/core/widgets/CustomButton.dart';
import 'package:in_egypt/core/widgets/CustomLoadingWidget.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomEmailTextField.dart';

class CustomResetPasswordViewBodyBlocBuilder extends StatelessWidget {
  CustomResetPasswordViewBodyBlocBuilder({
    super.key,
    required this.state,
  });
  final CustomResetPasswordState state;
  GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
  TextEditingController resetPasswordemailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Form(
      key: resetPasswordFormKey,
      child: CustomLoadingWidget(
        isloading: state is CustomResetPasswordLoading ? true : false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kHorizentalPadding, vertical: kVerticalPadding),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  '''لو نسيت كلمة المرور بتاعتك، مفيش أي مشكلة!
كل اللي عليك تعمله إنك تدخل البريد الإلكتروني اللي سجلت بيه حسابك، وإحنا هنرسل لك رسالة على الإيميل فيها رابط آمن لإعادة تعيين كلمة المرور.

اضغط على الرابط اللي هيجيلك في الرسالة، وبعدها هتقدر تختار كلمة مرور جديدة بكل سهولة.

متقلقش، بياناتك في أمان تام، وإنت الوحيد اللي يقدر يدخل على حسابك بعد تغيير كلمة المرور.''',
                  style: AppTextStyles(context)
                      .regular13
                      .copyWith(color: isDark ? Colors.white : Colors.black),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 50),
              CustomEmailTextField(
                isIconVisible: true,
                controller: resetPasswordemailController,
              ),
              const Spacer(),
              Custombutton(
                  text: "استعادة كلمة المرور",
                  color: kMainColor,
                  textColor: Colors.black,
                  onPressed: () {
                    if (resetPasswordFormKey.currentState!.validate()) {
                      context
                          .read<CustomResetPasswordCubit>()
                          .sendResetPasswordEmail(
                              context: context,
                              email: resetPasswordemailController.text);
                    }
                  }),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "الرجوع لتسجيل الدخول",
                  style: AppTextStyles(context)
                      .regular16
                      .copyWith(color: kMainColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
