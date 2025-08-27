import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Trips/presentation/views/widgets/MyTripDetailsViewWidgets/MyTripDetailsViewBody.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';

class MyTripDetailsView extends StatelessWidget {
  const MyTripDetailsView({super.key, required this.bookingEntity});
  final BookingEntity bookingEntity;
  static String routeName = "/MyTripDetailsView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBartitle: "تفاصيل الرحلة"),
      body: MyTripDetailsViewBody(
        bookingEntity: bookingEntity,
      ),
    );
  }
}
