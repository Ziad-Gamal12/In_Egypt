import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Auth/domain/Repos/AuthRepo.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpViewBody.dart';
import 'package:in_egypt/Features/Auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:in_egypt/core/services/get_it_Service.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = '/sign-up';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(appBartitle: "انشاء حساب"),
        body: SignUpViewBody(),
      ),
    );
  }
}
