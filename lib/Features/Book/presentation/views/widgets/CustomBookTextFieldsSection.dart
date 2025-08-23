import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomEmailTextField.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomTeaxtField.dart';

class CustomBookTextFieldsSection extends StatefulWidget {
  const CustomBookTextFieldsSection({
    super.key,
  });

  @override
  State<CustomBookTextFieldsSection> createState() =>
      _CustomBookTextFieldsSectionState();
}

class _CustomBookTextFieldsSectionState
    extends State<CustomBookTextFieldsSection> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    BookingEntity bookingEntity = context.read<BookingEntity>();
    return Column(
      children: [
        Customteaxtfield(
            labelText: "أسم المسؤول",
            prefixIcon: FontAwesomeIcons.user,
            obscureText: false,
            textInputType: TextInputType.name,
            onSaved: (val) {
              bookingEntity.user.fullName = val ?? '';
            },
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'الرجاء إدخال اسم المسؤول';
              }
              return null;
            }),
        SizedBox(
          height: 20,
        ),
        CustomEmailTextField(
          onSaved: (value) {
            bookingEntity.user.email = value ?? '';
          },
          controller: textEditingController,
        ),
        SizedBox(
          height: 20,
        ),
        Customteaxtfield(
            labelText: "رقم الهاتف",
            obscureText: false,
            textInputType: TextInputType.phone,
            prefixIcon: FontAwesomeIcons.phone,
            onSaved: (val) {
              bookingEntity.user.phoneNumber = val ?? '';
            },
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'الرجاء إدخال رقم الهاتف';
              } else if (val.length < 11) {
                return 'الرجاء إدخال رقم هاتف صالح';
              }
              return null;
            }),
        SizedBox(
          height: 20,
        ),
        Customteaxtfield(
            labelText: "عدد الافراد",
            prefixIcon: FontAwesomeIcons.users,
            obscureText: false,
            textInputType: TextInputType.number,
            onSaved: (val) {
              bookingEntity.numberOfGuests = int.parse(val ?? '0');
            },
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'الرجاء إدخال عدد الافراد';
              }
              return null;
            }),
      ],
    );
  }
}
