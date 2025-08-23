part of 'booking_bloc_bloc.dart';

@immutable
sealed class BookingBlocState {}

final class BookingBlocInitial extends BookingBlocState {}

final class BookingAddBookingLoading extends BookingBlocState {}

final class BookingAddBookingSuccess extends BookingBlocState {}

final class BookingAddBookingFailure extends BookingBlocState {
  final String errmessage;
  BookingAddBookingFailure(this.errmessage);
}
