import 'package:in_egypt/core/Entities/BookingEntity.dart';

class GetMyTripsResponseEntity {
  final List<BookingEntity> bookings;
  final bool hasMore;

  GetMyTripsResponseEntity({required this.bookings, required this.hasMore});
}
