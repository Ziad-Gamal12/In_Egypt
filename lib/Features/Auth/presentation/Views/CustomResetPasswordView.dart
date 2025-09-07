// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Auth/domain/Repos/AuthRepo.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/CustomResetPasswordViewBody.dart';
import 'package:in_egypt/Features/Auth/presentation/manager/Custom_reset_password_cubit/Custom_reset_password_cubit.dart';
import 'package:in_egypt/core/services/get_it_Service.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';

class CustomResetPasswordView extends StatelessWidget {
  const CustomResetPasswordView({super.key});
  static const routeName = '/CustomResetPasswordView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CustomResetPasswordCubit(authrepo: getIt<AuthRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(
          appBartitle: "نسيت كلمة المرور",
        ),
        body: const CustomResetPasswordViewBody(),
      ),
    );
  }
}
