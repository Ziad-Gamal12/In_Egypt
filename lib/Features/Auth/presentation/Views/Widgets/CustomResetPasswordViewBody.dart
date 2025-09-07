// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/CustomResetPasswordViewBodyBlocBuilder.dart';
import 'package:in_egypt/Features/Auth/presentation/manager/Custom_reset_password_cubit/Custom_reset_password_cubit.dart';
import 'package:in_egypt/core/helpers/ShowSnackBar.dart';

class CustomResetPasswordViewBody extends StatelessWidget {
  const CustomResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomResetPasswordCubit, CustomResetPasswordState>(
      listener: (context, state) {
        if (state is CustomResetPasswordSuccess) {
          showSuccessSnackBar(
              context: context, message: "تم ارسال رابط استعادة كلمة المرور");
        } else if (state is CustomResetPasswordFailure) {
          showErrorSnackBar(context: context, message: state.errmessage);
        }
      },
      builder: (context, state) {
        return CustomResetPasswordViewBodyBlocBuilder(
          state: state,
        );
      },
    );
  }
}
