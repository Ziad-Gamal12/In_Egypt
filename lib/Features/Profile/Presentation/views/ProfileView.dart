import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/widgets/ProfileViewBody.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBartitle: "الملف الشخصي",
      ),
      body: ProfileViewBody(),
    );
  }
}
