import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/widgets/AboutUsViewWidgets/AboutUsViewBody.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});
  static String routeName = "/AboutUsView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBartitle: "من نحن"),
      body: AboutUsViewBody(),
    );
  }
}
