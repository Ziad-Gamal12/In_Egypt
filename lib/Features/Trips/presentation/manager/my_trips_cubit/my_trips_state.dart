part of 'my_trips_cubit.dart';

@immutable
sealed class MyTripsState {}

final class MyTripsInitial extends MyTripsState {}

final class MyTripsGetMyTripsLoading extends MyTripsState {
  final bool isFirstLoading;
  MyTripsGetMyTripsLoading({required this.isFirstLoading});
}

final class MyTripsGetMyTripsSuccess extends MyTripsState {
  final GetMyTripsResponseEntity getMyTripsResponseEntity;
  MyTripsGetMyTripsSuccess({required this.getMyTripsResponseEntity});
}

final class MyTripsGetMyTripsFailure extends MyTripsState {
  final String errmessage;
  MyTripsGetMyTripsFailure({required this.errmessage});
}

// searh my trips
final class MyTripsSearchMyTripsLoading extends MyTripsState {}

final class MyTripsSearchMyTripsSuccess extends MyTripsState {
  final List<BookingEntity> bookings;
  MyTripsSearchMyTripsSuccess({required this.bookings});
}

final class MyTripsSearchMyTripsFailure extends MyTripsState {
  final String errmessage;
  MyTripsSearchMyTripsFailure({required this.errmessage});
}
