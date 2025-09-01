import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt/core/helpers/getUserData.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomEmailTextField.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomPasswordTextField.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomTeaxtField.dart';

class PersonalDetailsViewBodyTextFields extends StatefulWidget {
  const PersonalDetailsViewBodyTextFields({
    super.key,
  });

  @override
  State<PersonalDetailsViewBodyTextFields> createState() =>
      _PersonalDetailsViewBodyTextFieldsState();
}

class _PersonalDetailsViewBodyTextFieldsState
    extends State<PersonalDetailsViewBodyTextFields> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController phoneController;

  late TextEditingController emailController;
  @override
  void initState() {
    UserEntity user = getUserData();
    emailController = TextEditingController(
      text: user.email,
    );
    firstNameController = TextEditingController(
      text: user.firstName,
    );
    lastNameController = TextEditingController(
      text: user.lastName,
    );
    phoneController = TextEditingController(
      text: user.phoneNumber,
    );

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Customteaxtfield(
            controller: firstNameController,
            labelText: "الأسم الأول",
            prefixIcon: Icons.account_circle_outlined,
            obscureText: false,
            textInputType: TextInputType.name,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'الرجاء إدخال الاسم الأول';
              }
              return null;
            }),
        const SizedBox(
          height: 20,
        ),
        Customteaxtfield(
            controller: lastNameController,
            prefixIcon: Icons.account_circle_outlined,
            labelText: "الاسم ألاخير",
            obscureText: false,
            textInputType: TextInputType.name,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'الرجاء إدخال الاسم الأخير';
              }
              return null;
            }),
        const SizedBox(
          height: 20,
        ),
        CustomEmailTextField(controller: emailController),
        const SizedBox(
          height: 20,
        ),
        Customteaxtfield(
            controller: phoneController,
            prefixIcon: Icons.phone,
            labelText: "رقم الهاتف",
            obscureText: false,
            textInputType: TextInputType.phone,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'الرجاء إدخال رقم الهاتف';
              }
              return null;
            }),
        const SizedBox(
          height: 20,
        ),
        CustomPasswordTextField(
          hintOrlabalText: "كلمة المرور الحالية",
        ),
        const SizedBox(
          height: 20,
        ),
        CustomPasswordTextField(
          hintOrlabalText: "كلمة المرور الجديدة",
        ),
      ],
    );
  }
}
