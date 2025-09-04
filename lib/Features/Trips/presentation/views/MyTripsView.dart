import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Trips/domain/Repos/MyTripsRepo.dart';
import 'package:in_egypt/Features/Trips/presentation/manager/my_trips_cubit/my_trips_cubit.dart';
import 'package:in_egypt/Features/Trips/presentation/views/widgets/MyTripsViewBody.dart';
import 'package:in_egypt/core/services/get_it_Service.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';

class MyTripsView extends StatelessWidget {
  const MyTripsView({super.key});
  static const routeName = '/MyTripsView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyTripsCubit(myTripsRepo: getIt<MyTripsRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(
          appBartitle: "رحلاتي",
          isBackButton: false,
        ),
        body: MyTripsViewBody(),
      ),
    );
  }
}
