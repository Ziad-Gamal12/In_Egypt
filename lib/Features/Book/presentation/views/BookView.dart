import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Book/domain/repos/BookingsRepo/BookingsRepo.dart';
import 'package:in_egypt/Features/Book/domain/repos/PaymentRepo/PaymentRepo.dart';
import 'package:in_egypt/Features/Book/presentation/manager/booking_bloc/booking_bloc_bloc.dart';
import 'package:in_egypt/Features/Book/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:in_egypt/Features/Book/presentation/manager/steps_cubit/steps_cubit.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/BookViewBody.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/helpers/getUserData.dart';
import 'package:in_egypt/core/services/get_it_Service.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';
import 'package:provider/provider.dart';

class BookPlaceView extends StatefulWidget {
  const BookPlaceView({super.key, required this.place});
  static const routeName = '/BookPlace';
  final PlaceEntity place;
  @override
  State<BookPlaceView> createState() => _BookPlaceViewState();
}

class _BookPlaceViewState extends State<BookPlaceView> {
  BookingEntity bookingEntity = BookingEntity(
      user: getUserData(),
      place: null,
      startAt: null,
      qrCodeUrl: "",
      endAt: null,
      createdAt: DateTime.now(),
      daysDuration: null,
      numberOfGuests: null,
      status: "pending",
      id: "${DateTime.now().millisecondsSinceEpoch}",
      totalPrice: null,
      paymentMethod: null);
  @override
  void initState() {
    bookingEntity.place = widget.place;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => StepsCubit()),
        BlocProvider(
            create: (context) => BookingBloc(
                  bookingsRepo: getIt<BookingsRepo>(),
                )),
        BlocProvider(
            create: (context) => PaymentCubit(
                  paymentRepo: getIt<PaymentRepo>(),
                )),
      ],
      child: Provider.value(
        value: bookingEntity,
        child: Scaffold(
          appBar: CustomAppBar(appBartitle: "الحجز"),
          body: BookViewBody(
            place: widget.place,
          ),
        ),
      ),
    );
  }
}
