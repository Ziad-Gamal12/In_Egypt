import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Book/domain/repos/PaymentRepo/PaymentRepo.dart';
import 'package:in_egypt/Features/Book/presentation/manager/booking_cubit/booking_cubit.dart';
import 'package:in_egypt/Features/Book/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:in_egypt/Features/Book/presentation/manager/steps_cubit/steps_cubit.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/BookViewBody.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/services/get_it_Service.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';

class BookPlaceView extends StatefulWidget {
  const BookPlaceView({super.key, required this.place});
  static const routeName = '/BookPlace';
  final PlaceEntity place;
  @override
  State<BookPlaceView> createState() => _BookPlaceViewState();
}

class _BookPlaceViewState extends State<BookPlaceView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => StepsCubit()),
        BlocProvider(create: (context) => BookingCubit()),
        BlocProvider(
            create: (context) => PaymentCubit(
                  paymentRepo: getIt<PaymentRepo>(),
                )),
      ],
      child: Scaffold(
        appBar: CustomAppBar(appBartitle: "الحجز"),
        body: BookViewBody(),
      ),
    );
  }
}
