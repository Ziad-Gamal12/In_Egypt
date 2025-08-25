part of 'my_trips_cubit.dart';

@immutable
sealed class MyTripsState {}

final class MyTripsInitial extends MyTripsState {}

final class MyTripsGetMyTripsLoading extends MyTripsState {}

final class MyTripsGetMyTripsSuccess extends MyTripsState {
  final GetMyTripsResponseEntity getMyTripsResponseEntity;
  MyTripsGetMyTripsSuccess({required this.getMyTripsResponseEntity});
}

final class MyTripsGetMyTripsFailure extends MyTripsState {
  final String errmessage;
  MyTripsGetMyTripsFailure({required this.errmessage});
}
