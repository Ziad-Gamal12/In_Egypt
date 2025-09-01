import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/widgets/PersonalDetailsViewWidgets/PersonalDetailsViewBodyTextFields.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/widgets/CustomButton.dart';

class PersonalDetailsViewBody extends StatefulWidget {
  const PersonalDetailsViewBody({super.key});

  @override
  State<PersonalDetailsViewBody> createState() =>
      _PersonalDetailsViewBodyState();
}

class _PersonalDetailsViewBodyState extends State<PersonalDetailsViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kHorizentalPadding, vertical: kVerticalPadding),
      child: Column(
        children: [
          PersonalDetailsViewBodyTextFields(),
          Spacer(),
          Custombutton(
              text: "حفظ",
              color: kMainColor,
              textColor: Colors.black,
              onPressed: () {}),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
