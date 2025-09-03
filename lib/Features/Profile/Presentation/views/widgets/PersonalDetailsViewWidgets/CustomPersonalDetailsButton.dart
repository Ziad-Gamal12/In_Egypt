import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt/Features/Profile/Presentation/manager/cubit/update_user_data_cubit.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/widgets/CustomButton.dart';

class CustomPersonalDetailsButton extends StatelessWidget {
  const CustomPersonalDetailsButton({
    super.key,
    required this.formKey,
    required this.user,
    required this.newpasswordController,
    required this.currentpasswordController,
  });

  final GlobalKey<FormState> formKey;
  final UserEntity user;
  final TextEditingController newpasswordController;
  final TextEditingController currentpasswordController;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UpdateUserDataCubit, UpdateUserDataState, bool>(
      selector: (state) {
        if (state is UpdateUserDataLoading) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        if (state) {
          return Center(
              child: const CircularProgressIndicator(
            color: kMainColor,
          ));
        }
        return Custombutton(
            text: "حفظ",
            color: kMainColor,
            textColor: Colors.black,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                user.fullName = "${user.firstName} ${user.lastName}";
                String? newPassword = newpasswordController.text == ""
                    ? null
                    : newpasswordController.text;
                String currentPassword = currentpasswordController.text;
                context.read<UpdateUserDataCubit>().updateUser(
                    newPassword: newPassword,
                    userEntity: user,
                    currentPassword: currentPassword);
              }
            });
      },
    );
  }
}
