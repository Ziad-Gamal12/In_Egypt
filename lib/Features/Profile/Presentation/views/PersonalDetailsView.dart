import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/widgets/PersonalDetailsViewWidgets/PersonalDetailsViewBody.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';

class PersonalDetailsView extends StatelessWidget {
  const PersonalDetailsView({super.key});
  static const String routeName = '/PersonalDetailsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBartitle: "تفاصيل الملف الشخصي"),
      body: PersonalDetailsViewBody(),
    );
  }
}
