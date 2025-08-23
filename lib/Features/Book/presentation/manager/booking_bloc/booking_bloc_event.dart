part of 'booking_bloc_bloc.dart';

@immutable
sealed class BookingBlocEvent {}

class PaymentSuccessEvent extends BookingBlocEvent {
  final BookingEntity bookingEntity;

  PaymentSuccessEvent({required this.bookingEntity});
}

class PaymentFailedEvent extends BookingBlocEvent {}

class PaymentLoadingEvent extends BookingBlocEvent {}
