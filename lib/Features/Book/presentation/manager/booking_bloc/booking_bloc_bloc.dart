import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:in_egypt/Features/Book/domain/repos/BookingsRepo/BookingsRepo.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:meta/meta.dart';

part 'booking_bloc_event.dart';
part 'booking_bloc_state.dart';

class BookingBloc extends Bloc<BookingBlocEvent, BookingBlocState> {
  final BookingsRepo bookingsRepo;

  BookingBloc({required this.bookingsRepo}) : super(BookingBlocInitial()) {
    on<PaymentSuccessEvent>((event, emit) async {
      emit(BookingAddBookingLoading());
      final result =
          await bookingsRepo.addBooking(bookingEntity: event.bookingEntity);
      result.fold((failure) => emit(BookingAddBookingFailure(failure.message)),
          (success) => emit(BookingAddBookingSuccess()));
    });
    on<PaymentFailedEvent>((event, emit) {
      log("PaymentFailedEvent");
      emit(BookingAddBookingFailure("عملية الدفع فاشلة"));
    });
    on<PaymentLoadingEvent>((event, emit) => emit(BookingAddBookingLoading()));
  }
}
