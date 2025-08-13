import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Auth/domain/Repos/AuthRepo.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignInViewWidgets/SignInViewBody.dart';
import 'package:in_egypt/Features/Auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:in_egypt/core/services/get_it_Service.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = '/sign-in';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(resizeToAvoidBottomInset: false, body: SignInViewBody()),
    );
  }
}
