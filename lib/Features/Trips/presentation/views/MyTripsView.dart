import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Trips/presentation/views/widgets/MyTripsViewBody.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';

class MyTripsView extends StatelessWidget {
  const MyTripsView({super.key});
  static const routeName = '/MyTripsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBartitle: "رحلاتي"),
      body: MyTripsViewBody(),
    );
  }
}
