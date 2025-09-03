import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Auth/domain/Repos/AuthRepo.dart';
import 'package:in_egypt/Features/Profile/Presentation/manager/cubit/update_user_data_cubit.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/widgets/PersonalDetailsViewWidgets/PersonalDetailsViewBody.dart';
import 'package:in_egypt/core/services/get_it_Service.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';

class PersonalDetailsView extends StatelessWidget {
  const PersonalDetailsView({super.key});
  static const String routeName = '/PersonalDetailsView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateUserDataCubit(
        authRepo: getIt<AuthRepo>(),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(appBartitle: "تفاصيل الملف الشخصي"),
        body: PersonalDetailsViewBody(),
      ),
    );
  }
}
