import 'package:bloc/bloc.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/helpers/getUserData.dart';
import 'package:meta/meta.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());

  BookingEntity bookingEntity = BookingEntity(
      user: getUserData(),
      place: null,
      startAt: null,
      endAt: null,
      createdAt: DateTime.now(),
      daysDuration: null,
      numberOfGuests: null,
      status: "pending",
      id: "${DateTime.now().millisecondsSinceEpoch}",
      totalPrice: null,
      paymentMethod: null);
}
