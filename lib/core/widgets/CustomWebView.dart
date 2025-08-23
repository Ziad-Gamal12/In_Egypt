import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Book/domain/repos/BookingsRepo/BookingsRepo.dart';
import 'package:in_egypt/Features/Book/presentation/manager/booking_bloc/booking_bloc_bloc.dart';
import 'package:in_egypt/core/Entities/CustomWebViewNavigationRequirmentsEntity.dart';
import 'package:in_egypt/core/services/get_it_Service.dart';
import 'package:in_egypt/core/widgets/CustomWebViewBody.dart';

class CustomWebView extends StatelessWidget {
  const CustomWebView(
      {super.key, required this.customWebViewNavigationRequirmentsEntity});
  static const routeName = '/CustomWebView';
  final CustomWebViewNavigationRequirmentsEntity
      customWebViewNavigationRequirmentsEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BookingBloc(
              bookingsRepo: getIt<BookingsRepo>(),
            ),
        child: CustomWebViewBody(
          customWebViewNavigationRequirmentsEntity:
              customWebViewNavigationRequirmentsEntity,
        ));
  }
}
