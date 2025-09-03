import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt/core/helpers/getUserData.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomEmailTextField.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomPasswordTextField.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomTeaxtField.dart';
import 'package:provider/provider.dart';

class PersonalDetailsViewBodyTextFields extends StatefulWidget {
  const PersonalDetailsViewBodyTextFields({
    super.key,
    required this.formKey,
    required this.currentpasswordController,
    required this.newpasswordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController currentpasswordController;
  final TextEditingController newpasswordController;
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: widget.formKey,
          child: Column(
            children: [
              Customteaxtfield(
                  controller: firstNameController,
                  labelText: "الأسم الأول",
                  prefixIcon: Icons.account_circle_outlined,
                  obscureText: false,
                  textInputType: TextInputType.name,
                  onSaved: (val) {
                    context.read<UserEntity>().firstName = val ?? '';
                  },
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
                  onSaved: (val) {
                    context.read<UserEntity>().lastName = val ?? '';
                  },
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'الرجاء إدخال الاسم الأخير';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              CustomEmailTextField(
                  isIconVisible: true,
                  controller: emailController,
                  onSaved: (val) {
                    context.read<UserEntity>().email = val ?? '';
                  }),
              const SizedBox(
                height: 20,
              ),
              Customteaxtfield(
                  controller: phoneController,
                  prefixIcon: Icons.phone,
                  labelText: "رقم الهاتف",
                  obscureText: false,
                  textInputType: TextInputType.phone,
                  onSaved: (val) {
                    context.read<UserEntity>().phoneNumber = val ?? '';
                  },
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
                controller: widget.currentpasswordController,
                hintOrlabalText: "كلمة المرور الحالية",
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomPasswordTextField(
          controller: widget.newpasswordController,
          hintOrlabalText: "كلمة المرور الجديدة",
        ),
      ],
    );
  }
}
