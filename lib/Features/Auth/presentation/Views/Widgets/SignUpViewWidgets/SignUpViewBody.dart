import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpAgreementRow.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpButtonSection.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpConfirmPasswordField.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpEmailField.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpNameFields.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpPasswordField.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpPhoneField.dart';
import 'package:in_egypt/Features/Auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/helpers/ShowSnackBar.dart';
import 'package:in_egypt/core/widgets/CustomLoadingWidget.dart';
import 'package:provider/provider.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isTermsAccepted = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  UserEntity userEntity = UserEntity(
    isBlocked: false,
    isVerified: true,
    firstName: '',
    lastName: '',
    email: '',
    phoneNumber: '',
    fullName: '',
    createdAt: DateTime.now().toString(),
    uid: '',
    photoUrl: 'https://cdn-icons-png.flaticon.com/128/16683/16683419.png',
    role: 'User',
  );
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          showSuccessSnackBar(
            context: context,
            message: "تم انشاء الحساب بنجاح",
          );
        } else if (state is SignUpFailure) {
          showErrorSnackBar(context: context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomLoadingWidget(
          isloading: state is SignUpLoading,
          child: Provider.value(
            value: userEntity,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizentalPadding,
                vertical: kVerticalPadding,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SignUpNameFields(),
                      const SizedBox(height: 20),
                      const SignUpEmailField(),
                      const SizedBox(height: 20),
                      const SignUpPhoneField(),
                      const SizedBox(height: 20),
                      SignUpPasswordField(
                        passwordController: passwordController,
                      ),
                      const SizedBox(height: 20),
                      SignUpConfirmPasswordField(
                        confirmPasswordController: confirmPasswordController,
                      ),
                      const SizedBox(height: 20),
                      SignUpAgreementRow(
                        onChanged: (value) {
                          setState(() {
                            isTermsAccepted = value ?? false;
                          });
                        },
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                      SignUpButtonSection(
                        isTermsAccepted: isTermsAccepted,
                        passwordController: passwordController,
                        confirmPasswordController: confirmPasswordController,
                        formKey: formKey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
