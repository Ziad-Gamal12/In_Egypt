import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignUpViewWidgets/TermsAndConditionsViewBody.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';

class TermsAndConditionsView extends StatelessWidget {
  static const String routeName = "/TermsAndConditionsView";
  const TermsAndConditionsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBartitle: "الشروط والأحكام"),
      body: TermsAndConditionsViewBody(),
    );
  }
}
