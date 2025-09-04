import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt/Features/Profile/Presentation/manager/update_user_data_cubit/update_user_data_cubit.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/widgets/PersonalDetailsViewWidgets/CustomPersonalDetailsButton.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/widgets/PersonalDetailsViewWidgets/PersonalDetailsViewBodyTextFields.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/helpers/ShowSnackBar.dart';
import 'package:in_egypt/core/helpers/getUserData.dart';
import 'package:provider/provider.dart';

class PersonalDetailsViewBody extends StatefulWidget {
  const PersonalDetailsViewBody({super.key});

  @override
  State<PersonalDetailsViewBody> createState() =>
      _PersonalDetailsViewBodyState();
}

class _PersonalDetailsViewBodyState extends State<PersonalDetailsViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController currentpasswordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  UserEntity user = getUserData();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateUserDataCubit, UpdateUserDataState>(
        listener: (context, state) {
          if (state is UpdateUserDataSuccess) {
            showSuccessSnackBar(
                context: context, message: "تم تحديث البيانات بنجاح");
          } else if (state is UpdateUserDataFailure) {
            showErrorSnackBar(context: context, message: state.message);
          }
        },
        child: Provider.value(
          value: user,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kHorizentalPadding, vertical: kVerticalPadding),
            child: Column(
              children: [
                PersonalDetailsViewBodyTextFields(
                  currentpasswordController: currentpasswordController,
                  newpasswordController: newpasswordController,
                  formKey: formKey,
                ),
                Spacer(),
                CustomPersonalDetailsButton(
                    formKey: formKey,
                    user: user,
                    newpasswordController: newpasswordController,
                    currentpasswordController: currentpasswordController),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ));
  }
}
